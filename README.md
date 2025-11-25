![WhatsApp Image 2025-11-25 at 10 51 32_531b26d3](https://github.com/user-attachments/assets/8e4b0d0b-861b-418e-87f4-c19bede73ec6)🚦 Traffic Light Controller using Verilog (FSM) – Vivado Simulation

This project implements a Traffic Light Controller using Verilog HDL based on a Moore Finite State Machine (FSM).
The design is simulated using Vivado with a self-checking testbench, RTL schematic generation, and waveform verification.

🧠 Project Overview

A traffic light controller cycles through three states:

🔴 RED

🟢 GREEN

🟡 YELLOW

Each state uses a programmable timer, implemented using an 8-bit down counter.
The FSM transitions to the next state only when the timer reaches zero.

This project demonstrates:
FSM Design (Moore Machine)
Counter-based timing logic
Synchronous sequential logic
Reset handling
Testbench verification
RTL schematic understanding

📁 Repository Structure

traffic_light_controller/
│── src/
│    ├── traffic_light.v      # RTL design
│    └── traffic_tb.v         # Testbench
│── images/
│    ├── waveform.png         # Simulation waveform
│    └── rtl_schematic.png    # Vivado RTL schematic
│── README.md                 # Project documentation
│── LICENSE (optional)

📌 Features
✔ Moore FSM with 3 states
✔ 8-bit down counter for timing
✔ Asynchronous reset
✔ Fully synthesizable Verilog
✔ Complete testbench for simulation
✔ Verified waveform in Vivado
✔ RTL schematic auto-generated in Vivado

🧩 State Encoding
State	Binary	Light Output
RED	3'b001	3'b100
GREEN	3'b010	3'b001
YELLOW	3'b100	3'b010

🔧 Tools Used

Xilinx Vivado (Simulation + RTL Analysis)
Verilog HDL
Text Editor / VS Code (optional)

▶ Simulation
The testbench performs:
Clock generation (100 MHz)
Reset pulse
State and counter observation
Waveform visualization
Timing verification of RED → GREEN → YELLOW cycles

📘 How It Works

1. On reset → FSM enters RED.
2. Timer loads RED_TIME.
3. Counter decreases every clock cycle.
4. When counter reaches zero → transition to next state.
5. Timer reloads based on upcoming state.
6. light[2:0] output depends only on the current state (Moore FSM).


🏗 Future Enhancements

🚦 4-way intersection controller
🚶 Pedestrian crossing module
🆘 Emergency priority mode
🔄 Sensor-based inputs (Mealy FSM)
⏱ Parameterized timing configuration

Author

Vinushree A A
ECE Undergraduate | Aspiring VLSI Engineer
Interested in RTL Design, Verification (SV/UVM), and Digital Logic.
