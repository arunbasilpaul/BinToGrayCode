# Binary to Gray code converter
This project serves as an introduction to a new FPGA board i.e. EDGE ZYNQ SoC FPGA Development Board. An FSM that converts a binary input to its gray output has been designed using a State Machine. The State Machine was tested using a test bench before being deployed on the board. This project will later be used for the ILA project in the future.
<p align="center">
  <img width="60%" 
       src="https://images.pexels.com/photos/9951077/pexels-photo-9951077.jpeg">
</p>
The idea is to have a 4-bit input using the slide switches of the EDGE FPGA board. The first bit, i.e. 0, would be used to confirm the input as being ready, while the rest, i.e. 1,2,3 would be the input. It would then be passed onto an FSM in the PL and converted to its corresponding gray code. The output will be shown using the 4-bit LEDs with the 0th bit corresponding to the ready position of the input, and the rest, i.e. 1,2,3 shows the gray code.
