🛠️ Step-by-Step Implementation Guide in Vivado
Follow these steps to build and run this project from scratch using AMD Xilinx Vivado:

Step 1: Create a New Project
Open AMD Xilinx Vivado Design Suite.

Click on Create Project in the startup window (or go to File -> New Project).

Click Next, enter a project name (e.g., Project_01_Switch_LED), and choose a working directory.

Select RTL Project ("Do not specify sources at this time") and click Next.

In the Default Part selection menu, filter and select your specific hardware target:

Family: Artix-7

Package: cpg236

Speed Grade: -1

Target Part: xc7a35tcpg236-1 (Basys 3 board chip)

Click Finish to initialize the workspace.

Step 2: Add Design Sources & Constraints
In the Sources window on the left, click the + (Add Sources) button.

Select Add or create design sources and click Next.

Click Create File, set File Type to VHDL, name it direct_sw_led, and click Finish -> OK.

Paste the VHDL source code provided above into the file editor.

Back in the Sources window, click the + (Add Sources) button again.

Select Add or create constraints and click Next.

Click Create File, name it constraints, and click Finish -> OK.

Open the created .xdc file and paste the pinout constraints provided above.

Step 3: Synthesis & Implementation
In the left-hand panel under Flow Navigator, click Run Synthesis. Vivado will analyze and compile the VHDL code into gate-level logic.

Once synthesis completes, click Run Implementation. This step maps the logic gates to physical slices on the Artix-7 chip and routes the internal interconnections.

Step 4: Generate Bitstream & Program the Board
Connect your Digilent Basys 3 board to your computer via a micro-USB data cable and turn the power switch ON.

In the Flow Navigator, click Generate Bitstream. This compiles the implementation results into a binary configuration file (.bit).

When finished, select Open Hardware Manager and click Auto Connect.

Click Program Device and select your target FPGA device (xc7a35t_0). The .bit file path is automatically populated.

Click Program.

🧪 Verification & Testing
Flip switch SW0 upwards (ON) -> LED LD0 should light up instantly.

Flip switch SW15 upwards (ON) -> LED LD15 should light up instantly.

Test all switches individually or in combinations to verify complete I/O functionality.
