# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |


## Lab Summary 

In this lab we implemented a One hot and Binary state machines and tested them on the the board. We first started with the one Hot encoding, wher we created a set of 5 wires for the next and 5 wires for the state. Then we created 5 instances of the d-flip flops and then wired the next and the state wires into them. Then after we assigned the logic for the z and the which was Cstate | Estate; and the next wires acoording to the table which the lab provided us with. Then to implement the binary encoding we created two 3 bit wires one for state and one called next. Then we created three instances of the d flip flop for each of the bits and then wired state and next into them. Then we assigned z with (~State[2]& State[1] & ~State[0]) + (State[2] & ~State[1] & ~State[0]); and the next wires with the corresponding logic which we got from the table the lab provided us with and we had to make 3-K maps (1 for each bit) and then we assigned that to next. Finally we wired everything in the top.v and everything worked as intended and we completed the demonstration succesfully.


## Lab Questions

### Compare and contrast One Hot and Binary encodings

One Hot uses one flip flop per state with a simple next state/output logic and usually has shorter critical paths, while binary on the other hand uses log_2N flip flops with the denser storage but more complex combinational logic. The more complex logic can make critical path longer so the max clock frequency can drop as well.

### Which method did your team find easier, and why?

We found the one hot easier to implement because each state is a single bit and the transitions mapped directly to the wires.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.

We would like use binary encodings when FPGA flip flops are scarce and the state count is large or when we are trying to minimize the usage. 
