<img width="4128" height="2322" alt="image" src="https://github.com/user-attachments/assets/9532854d-f0a8-4650-b121-5caca1f1ffc0" />

# 16-Note VHDL Music Synthesizer for Basys3

A digital music synthesizer implemented in VHDL on the Digilent Basys3 FPGA board (Artix-7). Each of the 16 onboard switches (`SW0` to `SW15`) maps to a distinct musical note spanning from C4 to C6.

---

## 🛠️ Step-by-Step Implementation Guide in Vivado

Follow these steps to build, synthesize, and run this project from scratch using AMD Xilinx Vivado:

### Step 1: Create a New Project
1. Open AMD Xilinx Vivado Design Suite.
2. Click on **Create Project** in the startup window (or go to `File -> New Project`).
3. Click **Next**, enter a project name (e.g., `basys3_16note_synth`), and choose your working directory.
4. Select **RTL Project** ("Do not specify sources at this time") and click **Next**.
5. In the Default Part selection menu, filter and select your specific hardware target:
   - **Family:** Artix-7
   - **Package:** cpg236
   - **Speed Grade:** -1
   - **Target Part:** `xc7a35tcpg236-1` (Basys 3 board chip)
6. Click **Finish** to initialize the workspace.

### Step 2: Add Design Sources & Constraints
1. In the **Sources** window on the left, click the **+ (Add Sources)** button.
2. Select **Add or create design sources** and click **Next**.
3. Click **Create File**, set File Type to **VHDL**, name it `synth_top`, and click **Finish -> OK** (skip the port definition window by clicking *Yes*).
4. Open `synth_top.vhd` and paste the VHDL source code provided in this repository.
5. Back in the Sources window, click the **+ (Add Sources)** button again.
6. Select **Add or create constraints** and click **Next**.
7. Click **Create File**, name it `synth`, and click **Finish -> OK**.
8. Open the created `synth.xdc` file and paste the pinout constraints provided in this repository.

### Step 3: Synthesis & Implementation
1. In the left-hand panel under **Flow Navigator**, click **Run Synthesis**. Vivado will analyze and compile the VHDL code.
2. Once synthesis completes, click **Run Implementation**. This maps the logic gates to physical slices on the Artix-7 chip.

### Step 4: Generate Bitstream & Program the Board
1. **Safety First:** Ensure your Basys 3 board is **powered OFF** before making any physical audio connections.
2. Connect a 220Ω–330Ω protection resistor to **Pmod Port JC, Pin J1** (`audio_out`), and connect the ground to **Pin 7** (`GND`) to your headphones or speaker.
3. Turn the board power switch **ON** and connect it to your computer via a micro-USB cable.
4. In the Flow Navigator, click **Generate Bitstream**.
5. When finished, select **Open Hardware Manager** and click **Auto Connect**.
6. Click **Program Device** and select your target FPGA device (`xc7a35t_0`).
7. Click **Program**.

---

## 🧪 Verification & Testing
- Flip switch **SW0** upwards (ON) -> Generates note C4 on the audio output.
- Flip switch **SW15** upwards (ON) -> Generates note C6 (highest priority note takes precedence if multiple switches are active).
- Test all switches individually to verify complete tone mapping and priority logic functionality.
