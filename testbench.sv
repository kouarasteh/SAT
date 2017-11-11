module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
	logic frame_clk, Reset;
	logic [15:0] keycode;
	integer Planet1X = 350;
	 integer Planet1Y = 250;
	 integer Planet1S = 10;
	 integer Planet1M = 5;
	 integer Planet2X = 100;
	 integer Planet2Y = 100;
	 integer Planet2S = 20;
	 integer Planet2M = 5;
	 integer Planet3X = 420;
	 integer Planet3Y = 50;
	 integer Planet3S = 12;
	 integer Planet3M = 5;
	 integer Planet4X = 500;
	 integer Planet4Y = 340;
	 integer Planet4S = 19;
	 integer Planet4M = 5;
	 integer Planet5X = 580;
	 integer Planet5Y = 380;
	 integer Planet5S = 8;
	 integer Planet5M = 5;
	 integer Planet6X = 540;
	 integer Planet6Y = 110;
	 integer Planet6S = 24;
	 integer Planet6M = 5;
	 integer Planet7X = 180;
	 integer Planet7Y = 200;
	 integer Planet7S = 18;
	 integer Planet7M = 5;
	 integer Planet8X = 100;
	 integer Planet8Y = 400;
	 integer Planet8S = 10;
	 integer Planet8M = 5;
	integer VesselX, VesselY;
	 integer VesselS = 10;
	logic [1:0] state;
	logic [2:0] curplan;	
	logic welcomepage;
	integer theta, moontheta;
		
// Instantiating the test_top
// Make sure the module and signal names match with those in your design
orbitmachine om (.*);
// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 frame_clk = ~frame_clk;
end

initial begin: CLOCK_INITIALIZATION
    frame_clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
Reset = 0;
#5
Reset = 1;		// Toggle Reset
#5
Reset = 0;
#5
keycode = 16'h0000;
#5
keycode = 16'h0028;
#20
VesselX = 350;
VesselY = 250;
#20
keycode = 16'h002C;
#20
keycode = 16'h0000;
VesselX = 30;
VesselY = 30;
#20
VesselX = 100;
VesselY = 100;
#20
keycode = 16'h002C;
#20
keycode = 16'h0000;
VesselX = 30;
VesselY = 30;
#20
VesselX = 420;
VesselY = 50;
#20
keycode = 16'h002C;
#20
keycode = 16'h0000;
VesselX = 30;
VesselY = 30;
#20
VesselX = 500;
VesselY = 340;
#20
keycode = 16'h002C;
#20
keycode = 16'h0000;
VesselX = 30;
VesselY = 30;
#20
VesselX = 580;
VesselY = 380;
#20
keycode = 16'h002C;
#20
keycode = 16'h0000;
VesselX = 30;
VesselY = 30;
#20
VesselX = 540;
VesselY = 110;
#20
keycode = 16'h002C;
#20
keycode = 16'h0000;
VesselX = 30;
VesselY = 30;
#20
VesselX = 180;
VesselY = 200;
#20
keycode = 16'h002C;
#20
keycode = 16'h0000;
VesselX = 30;
VesselY = 30;
#20
VesselX = 100;
VesselY = 400;
#20
keycode = 16'h002C;
#20
keycode = 16'h0000;
VesselX = 30;
VesselY = 30;
end
endmodule
