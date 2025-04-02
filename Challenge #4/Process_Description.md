For this challenge, we are to use a large language model (LLM), in order to compare the suggested synthesis we get compared to the result developed in "Designing Silicon Brains using LLm: Leveraging Chatgpt for Automated Description of a Spiking Neuron Array". 
Here is the prelimenary series of steps that will be undertaken for this challenge: 
-Initially, I will use the same prompts that were used in the paper and compare if there are differences. (ask why if the results differ and jump down that rabbithole in a bit)
-Develop small deviations in the prompts used, and track the resulting output. Do the number of erros increase or decrease? are the types of errors different? do one style result in increased prompting to get to a desired end result as compared to the other?
-Leverage this experience to develop designs based on RLU and Hodgkin-Huxley neuron model

As to the toolchain to be used:
- Chatgpt will be utilized to generate most of the code and top modules.
- An Agent-Agent scheme will also be used in crafting prompts and the manner in which direction will be given to the Chatgpt agent. For these purposes claude will be utilized.
- For the purposes of testing, Questasim will be utilized to test the functionality of the AI-Generated Modules

Below is a transcript of the prompts used with Chatgpt:


Below is a transcript of the prompts used with Claude:


