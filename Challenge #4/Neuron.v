/*
Below is the output from the Chatgpt model 4o for the following prompt:

*/


module lif_neuron #(
    parameter WIDTH = 16,              // Bit-width of current input and potential
    parameter THRESHOLD = 100,         // Firing threshold
    parameter LEAK = 1,                // Leak value subtracted each cycle
    parameter REFRACTORY_CYCLES = 10   // Refractory period in clock cycles
)(
    input wire clk,
    input wire rst,                    // Active-high reset
    input wire signed [WIDTH-1:0] input_current, // Multibit signed input current
    output reg spike                   // High for 1 cycle when neuron spikes
);

    // Internal signals
    reg signed [WIDTH-1:0] membrane_potential = 0;
    reg [$clog2(REFRACTORY_CYCLES+1)-1:0] refractory_counter = 0;
    wire refractory = (refractory_counter != 0);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            membrane_potential <= 0;
            spike <= 0;
            refractory_counter <= 0;
        end else begin
            if (refractory) begin
                spike <= 0;
                refractory_counter <= refractory_counter - 1;
            end else begin
                // Update potential with leak and input current
                membrane_potential <= membrane_potential - LEAK + input_current;

                // Check for spike
                if (membrane_potential >= THRESHOLD) begin
                    spike <= 1;
                    membrane_potential <= 0;                // Reset potential on spike
                    refractory_counter <= REFRACTORY_CYCLES;
                end else begin
                    spike <= 0;
                end
            end
        end
    end

endmodule
