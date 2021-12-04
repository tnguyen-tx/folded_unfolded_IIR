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
Folding IIR is simply resource sharing
![image](https://user-images.githubusercontent.com/57820377/144724611-905d7a50-188a-4493-9943-802a9a02eed4.png)
