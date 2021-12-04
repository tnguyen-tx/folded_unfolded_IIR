# folded_unfolded_IIR
Unfolded IIR uses unrolling technique to increase through put of output. While folded IIR uses resource sharing technique in design to minimize hardware used.

# Unfolded IIR
Based on previous IIR design and applied unfolding technique the final design is below
![image](https://user-images.githubusercontent.com/57820377/144724129-0274cbd6-acb5-438b-ae8d-8adcce91d391.png)

* Note: For unfolded IIR, we see it's 2 outputs compare to normal IIR which means thru-put is increased.
Design:
* For design the circuit, it's straight foward. We used flip flops to retain previous results and apply multiplication and additions.
* Waveform:
![image](https://user-images.githubusercontent.com/57820377/144724509-3948bee2-0558-43ab-b871-37fb7c7f6603.png)

# Unfolded IIR
* Instead of using 6 multiplier and 2 adders, unfold IIR uses 1 multiplier and 1 adder only. This saves chip area but takes multiple clock cycles to complete operations.
* In design, it breaks down to multiple stages. Each stage does 1 multiplication and/or addition. In other words, circuit uses a state machine (or counter) to divide operation at each clock cycle.
* One-hot state machine is used for the best practice.
![image](https://user-images.githubusercontent.com/57820377/144724611-905d7a50-188a-4493-9943-802a9a02eed4.png)
