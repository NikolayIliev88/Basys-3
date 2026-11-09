# Basys 3 FPGA Portfolio & Projects

A comprehensive, production-grade collection of digital design projects, VHDL implementations, and hardware experiments developed for the **Digilent Basys 3** development board powered by the **AMD Xilinx Artix-7 FPGA**. 

This repository serves as an engineering portfolio and structured roadmap, progressing from basic input/output verification to complex system-on-chip architectures, synchronous data processors, and peripheral controllers.

---

## 📋 Basys 3 Board Technical Specifications

The Digilent Basys 3 is an entry-level yet remarkably powerful evaluation and development board tailored specifically for the Xilinx Vivado Design Suite. Below is an in-depth breakdown of its underlying hardware specifications and onboard peripherals:

### 1. Processing Core, Logic Fabric & Memory Architecture
* **FPGA Device:** Xilinx Artix-7 FPGA (`XC7A35T-1CPG236C`), optimized for high-performance, low-power logic design.
* **Logic Capacity:** 33,280 logic cells organized into 5,200 slices (each containing four 6-input LUTs and 8 flip-flops).
* **On-Chip RAM:** 1,800 Kbits of fast, dual-port Block RAM (BRAM).
* **Clock Management Tiles (CMT):** 5 DSP slices for high-speed arithmetic operations and 1 Mixed-Mode Clock Manager (MMCM) for precise clock synthesis, jitter reduction, and phase shifting.
* **Storage & Configuration:** 
  * 18 Mb (2 MB) Serial Flash memory (Micron N25Q032A) for non-volatile bitstream storage.
  * On-board Digilent USB-JTAG port (FTDI FT2232HQ) enabling rapid programming, hardware debugging (ILA/VIO), and bidirectional serial communication.

    <img width="1000" height="791" alt="image" src="https://github.com/user-attachments/assets/4d62d3dc-b97b-4b87-9d32-2c0c9bab9ae0" />

### 2. User Interface & Board-Level Peripherals
* **Slide Switches:** 16 high-reliability slide switches (`SW15` down to `SW0`) tied directly to 3.3V LVCMOS inputs with internal pull-down/pull-up network options.
* **Push Buttons:** 5 individual momentary push buttons (`BTNC`, `BTNU`, `BTND`, `BTNL`, `BTNR`) configured for manual reset, clock stepping, and interactive user inputs.
* **Discrete LEDs:** 16 high-efficiency green surface-mount LEDs (`LD15` down to `LD0`) driven by dedicated FPGA output buffers.
* **RGB LED:** 1 Tri-color independent RGB LED (`LD16`) capable of displaying full spectrum mixes via external or internal Pulse Width Modulation (PWM) drivers.
* **Seven-Segment Display:** 4-digit, 7-segment common-cathode display multiplexed through shared segment lines (`SEG A-G`, `DP`) and 4 individual anode select lines (`AN3` down to `AN0`) for decimal and hexadecimal numeric readouts.

    <img width="652" height="630" alt="image" src="https://github.com/user-attachments/assets/65b980fc-1f06-4058-938e-ce980335c38d" />


### 3. Expansion Ports, Connectivity & Interfacing
* **USB-UART Bridge:** Integrated FTDI bridge facilitating virtual COM port communication over USB for terminal interactions and data logging.
* **VGA Display Port:** 12-bit color VGA connector driven by an onboard resistor-ladder digital-to-analog converter (DAC), supporting 4 bits each for Red, Green, and Blue channels.
* **PMOD Standard Connectors:** 4 high-speed 12-pin Digilent Pmod ports providing 32 total direct FPGA I/O pins, compatible with hundreds of peripheral modules (sensors, displays, motor controllers, and transceivers).

