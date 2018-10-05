# SAT
An impractical retro orbiter game for FPGA
Introduction
	Our game is a gravity based game that tasks the user with timing jumps from various planets to reach a destination planet across a solar system. The vessel takes advantage of tangential movement from the centripetal acceleration of the vessel caused by the gravity of the planet it is orbiting to make its planetary jumps. There are several paths with varying obstacles like asteroids and moving moons, allowing the user to measure risk and reward to try and make the fastest time while still finishing. 
Written Description of the Key Aspects of the Final Project
The sincos module was one of the more unique solutions in our final project. We created it to serve as a lookup table to map an angle to useful x and y coordinates in the range of [-10, 10] for use in vessel motion control while the vessel was orbiting a planet. While it requires a large amount of hardware, the lookup table keeps the game very fast for smooth gameplay. 
	Describe how NIOS interacts with USB and VGA and general overview
The NIOS II is used to run C code and collect and output data from the FPGA USB and VGA ports respectively. The CY7C67200 is anEZ-OTG peripheral controller that is used for easier management of the USB OTG protocol. Functionally, the process of reading and writing to the USB involes selectively writing and reading from pins HPI_ADDR, the address being sent, and HPI_DATA, the data being sent. THE EZ-OTG handles internal operations regarding writing to HPI_MAILBOX for execution and temporary storage in RAM. 
The VGA is written to using the VGA_controller module, which outputs horizontal and vertical signal pulses to continuously update each pixel across the screen. The controller uses next-state variables with suffix ‘in’ to update the position of the pixel being updated, allowing for interrupts in the case of the ball appearing in one of those pixels. This allows for a smooth transition of ball movement across the screen with no observed glitches.
Written description of USB protocol
IO_write takes in an 8 bit address and 16 bits of data, then assigns the address to the OTG_HPI_address, a location in memory that the EZ_OTG uses as the address of memory to be read or written. Next, IO_write enables a chip with chip select, sets the OTG to write mode, and sends data to OTG_HPI_data, a location in memory that the EZ_OTG uses as storage for data to be read or written. Then write mode is disabled and the chip is deselected.
IO_read takes in only the 8-bit address of the data to be read. It sets this address to the OTG_HPI_address memory location, so that the EZ_OTG takes the address to return the contents of. Then a chip is selected and enabled, read mode is activated, and a temporary 16-bit unsigned int takes in the data stored at the OTG_HPI_data location where the EZ_OTG has left the contents of the memory address queried. Then read mode is disabled and chip select is deselected. Finally, the data queried is printed to console and returned.
UsbWrite is a simple program that writes its address parameter to the HPI_ADDR address memory location with IO_write, then writes its data parameter to the HPI_DATA data memory location with IO_write. The EZ_OTG uses these memory allocated addresses to determine the address to write to and the data to write in this address.
UsbRead writes its address parameter to the HPI_ADDR address memory location with IO_write, telling EZ_OTG the address to be queried. Then, UsbRead calls IO_read to retrieve the data transmitted to the HPI_DATA memory location by EZ_OTG.
 A Short Explanation of the keyboard compatibility issue

Several of the USB keyboards in the lab are not up to spec with the handshake ability for communication between the keyboard and the software. The software expects to receive a status byte of 0x03 when the keyboard sends a value but not all of the keyboards we used sent this status byte. Often the terminal was reading that the status byte was NULL, 0x00, and NIOS complained about compatibility issues with the keyboard. A simple fix suggested by Matthew Daniel was to bypass the check by manually setting the status byte after calling IO_Read. This option was approved by Professor Cheng and worked for our purposes.  
State Diagrams

The game starts on a start page and displays instructions for starting the screen using a font sprite. Once the Enter key code is received the game page is displayed and the vessel motion state machine is set to be in the bound state. The bound state controls the motion of the vessel by incrementing an angle and using that angle and the position of the planet to set the proper position of the vessel. When a the key code corresponding to the space bar is detected the state transitions to leaving and sets the motion for the unbound state. The unbound state is moving the vessel at a constant velocity across the screen and waits for a collision detection between the edge of the screen, a planet, or an asteroid. When a planet is detected the state machine goes to the arriving state which sets the current planet so that the vessel’s position can be accurately updated in the bound state. If an asteroid or the edge of the screen is detected the screen is updated to display a font sprite saying “GAME OVER” in red text.  







Vessel Motion Control:




Display pages for Start Screen, Game Screen, and End Screen




Block Diagram

State Machine Simulation

This simulation tests the ‘state’ variable as well as ‘curplan’ variable. ‘State’ of the satellite vessel is one of four values, 00 for bound to a planet, 01 for leaving orbit, 10 for unbound motion, and 11 for entering orbit of a new planet. ‘Curplan’ is the number of the current planet that the vessel is bound to. If the vessel is unbound, ‘curplan’ is 111, otherwise it corresponds to that planet’s number. We cycle through the planets, and observe that the state and curplan variables change as they could.





Module Descriptions

Module: VGA_controller.sv
Inputs: Clk, Reset
Outputs: VGA_HS, VGA_VS, VGA_CLK, VGA_BLANK_N, VGA_SYNC_N, [9:0]DrawX, [9:0]DrawY 
Description: Provides the signals to write the display on the monitor. 
Purpose: Our design uses font sprites and draws pixels based on the positions of objects imported from vessel.sv. Default pixel values determine background. 

Module: SAT.sv
Inputs: CLOCK_50, [3:0] KEY, OTG_INT
Outputs: [6:0]HEX0, [6:0]HEX1, [7:0]VGA_R, [7:0]VGA_G, [7:0]VGA_B, VGA_CLK, VGA_SYNC_N, VGA_BLANK_N, VGA_VS, VGA_HS, [1:0]OTG_ADDR, OTG_CS_N, OTG_RD_N, OTG_WR_N, OTG_RST_N, [12:0]DRAM_ADDR, [3:0]DRAM_DQM, DRAM_RAS_N, DRAM_CAS_N, DRAM_CKE, DRAM_WE_N, DRAM_CS_N, DRAM_CLK
Bidirectional:[15:0]OTG_DATA, [31:0]DRAM_DQ  
Description: Top level module for this final project. 
Purpose: Instantiates all other modules and makes their connections. 

Module: hpi_io_intf.sv
Inputs: Clk, REset, [1:0]from_sw_address, [15:0]from_sw_data_out, from_sw_r, from_sw_w, from_sw_cs
Outputs: [15:0]from_sw_data_in, [1:0]OTG_ADDR, OTG_RD_N, OTG_WR_N, OTG_CS_N, OTG_RST_N
Bidirectional:  [15:0]OTG_DATA
Description: Uses tristate buffers on USB for reading and writing to the bus. 
Purpose: This module is the interface for USB with the other PIOs on the FPGA board. 

Module: HexDriver.sv
Inputs: [3:0] In0
Output: [6:0] Out0  
Description: Converts hexadecimals into the binary needed to display the hex number on a digital display.
Purpose: Used to display hexadecimals on the FPGA hex displays. 

Module: Color_Mapper.sv
Inputs: 
Integer VesselX, VesselY, VesselS, Planet1X, Planet1Y, Planet1S, Planet2X, Planet2Y,Planet2S, Planet3X, Planet3Y, Planet3S, Planet4X, Planet4Y, Planet4S, Planet5X, Planet5Y, Planet5S, Planet6X, Planet6Y, Planet6S, Planet7X, Planet7Y, Planet7S, Planet8X, Planet8Y, Planet8S, Ast1X, Ast1Y, Ast1S, Ast2X, Ast2Y, Ast2S, Ast3X, Ast3Y, Ast3S, Ast4X, Ast4Y, Ast4S, Ast5X, Ast5Y, Ast5S, Ast6X, Ast6Y, Ast6S, Ast7X, Ast7Y, Ast7S, Ast8X, Ast8Y, Ast8S, Ast9X, Ast9Y, Ast9S, Ast10X, Ast10Y, Ast10S, Ast11X, Ast11Y, Ast11S, Ast12X, Ast12Y, Ast12S, Ast13X, Ast13Y, Ast13S, Ast14X, Ast14Y, Ast14S, Ast15X, Ast15Y, Ast15S, Ast16X, Ast16Y, Ast16S, Ast17X, Ast17Y, Ast17S, Ast18X, Ast18Y, Ast18S, Ast19X, Ast19Y, Ast19S, Ast20X, Ast20Y, Ast20S, Ast21X, Ast21Y, Ast21S, Ast22X, Ast22Y, Ast22S, Ast23X, Ast23Y, Ast23S, Ast24X, Ast24Y, Ast24S, moonx, moony, moons,DrawX, DrawY, 
Logic crash, welcomepage, win
Output:  [7:0] VGA_R, [7:0] VGA_G, [7:0] VGA_B
Description: Transmits pixels in the form of unsigned 8 bit numbers for the red, green, and blue components. 
Purpose: Used to draw pixels from the VGA display. Handles background as well as objects defined by ranges of pixels . 

Module: vessel.sv
Inputs: 
Logic Reset, frame_clk, Clk, [15:0] keycode, [1:0] state, [2:0] curplan
Integer Planet1X, Planet1Y, Planet1S, Planet1M, Planet2X, Planet2Y,Planet2S, Planet2M, Planet3X, Planet3Y, Planet3S, Planet3M, Planet4X, Planet4Y, Planet4S, Planet4M, Planet5X, Planet5Y, Planet5S, Planet5M, Planet6X, Planet6Y, Planet6S, Planet6M, Planet7X, Planet7Y, Planet7S, Planet7M, Planet8X, Planet8Y, Planet8S, Planet8M, Ast1X, Ast1Y, Ast1S, Ast2X, Ast2Y, Ast2S, Ast3X, Ast3Y, Ast3S, Ast4X, Ast4Y, Ast4S, Ast5X, Ast5Y, Ast5S, Ast6X, Ast6Y, Ast6S, Ast7X, Ast7Y, Ast7S, Ast8X, Ast8Y, Ast8S, Ast9X, Ast9Y, Ast9S, Ast10X, Ast10Y, Ast10S, Ast11X, Ast11Y, Ast11S, Ast12X, Ast12Y, Ast12S, Ast13X, Ast13Y, Ast13S, Ast14X, Ast14Y, Ast14S, Ast15X, Ast15Y, Ast15S, Ast16X, Ast16Y, Ast16S, Ast17X, Ast17Y, Ast17S, Ast18X, Ast18Y, Ast18S, Ast19X, Ast19Y, Ast19S, Ast20X, Ast20Y, Ast20S, Ast21X, Ast21Y, Ast21S, Ast22X, Ast22Y, Ast22S, Ast23X, Ast23Y, Ast23S, Ast24X, Ast24Y, Ast24S, moontheta, sin, cos, theta, sinmoon, cosmoon
Outputs: 
Logic crash, win
Integer VesselX, VesselY, VesselS, moonx, moony, moons, thetaout, thetaoutmoon
Description: Includes many cases and sets position and motion of the vessel based on the input values set elsewhere. 
Purpose: Does edge detection for the edge of the screen as well as collision handling for planets allowing the vessel to orbit them. Additionally collisions with asteroids causing a game over are detected in this module. 

Module: sincos.sv
Inputs: Clk, integer thetaout
Outputs: integer sin, integer cos
Description: A lookup table for integer values of sine and cosine of an input angle, theta. It’s scaled to our most common planet size, 10, to give the function a useful range. 
Purpose: Used for changing the position of the vessel while it is orbiting a planet. Theta tracks the orientation around the planet and sets the speed but sincos is necessary to set the actual position. 

Module: orbitmachine.sv
Inputs: 
Integer Planet1X, Planet1Y, Planet1S, Planet1M, Planet2X, Planet2Y,Planet2S, Planet2M, Planet3X, Planet3Y, Planet3S, Planet3M, Planet4X, Planet4Y, Planet4S, Planet4M, Planet5X, Planet5Y, Planet5S, Planet5M, Planet6X, Planet6Y, Planet6S, Planet6M, Planet7X, Planet7Y, Planet7S, Planet7M, Planet8X, Planet8Y, Planet8S, Planet8M, VesselX, VesselY, VesselS
Logic frame_clk, Reset, [15:0] keycode
Outputs:  
Integer theta, moontheta
Logic [1:0] state, [2:0] curplan, welcomepage
Description: State machine for the conditions the vessel is subject. States include bound to a planet, unbound, and buffer states separating these two called arriving and leaving. 
Purpose: Determines which kind of motion control is used to determine the position of the vessel. The standard motion from the original ball.sv is used for the unbound state and a tracking angle is used for the bound state. 

Module: SAT_soc.qsys
Description:  This file generates the connections between the PIOs in NIOS.
Purpose: Allows the PIOs to share data as well as interact with the FPGA board’s external ports. 


LUT
2595 Logic Elements
DSP
10 Blocks used
Memory(BRAM)
82,944 bits
Flip-Flop
2,252 Registers
Frequency
141.56 MHz
Static Power
101.97mW
Dynamic Power
0.93 mW
Total Power
171.85 mW

Conclusion
	We were able to implement much of the functionality we had planned. Some possible extensions would be to add a scoring system based on time, a high score leaderboard, and several more planet configurations for variety. Sprites to make the game more visually appealing would be a good addition. A frame buffer would be a good way to implement some better graphics. 
	After exploring the capabilities of the FPGA we moved away from a relative gravity field and thrust as the system of movement for the vessel. A gravity field would have required square root which is not feasible given the time constraints of our final project. The movement system we implemented was better for the purpose of achieving the functionality of our game.  Allowing for a controlled movement based on the conditions namely orbiting a planet or moving through space uninhibited by gravity allowed for a feasible execution of our design.  
