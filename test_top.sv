module test_top(
	input logic	Clk, Reset, Run, Continue,
	input logic [15:0] S,
	output logic [11:0] LED,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3,
	output logic [15:0] progcount,
	output logic [15:0]	instreg,
	output logic [15:0] mar,
	output logic [15:0] mdr
);
	wire [15:0]	data;
	logic ce1, ub1, lb1, oe1, we1;
	logic [19:0] address;
	slc3 bugs (	.Clk(Clk), .Reset(Reset), .Run(Run), .Continue(Continue), 
					.CE(ce1), .UB(ub1), .LB(lb1), .OE(oe1), .WE(we1), .S(S), 
					.ADDR(address), .Data(data), .outpc(progcount), 
					.outir(instreg), .outmar(mar), .outmdr(mdr),
					.HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .LED(LED));
	test_memory bunny(.Clk(Clk), .Reset(Reset), .I_O(data), .A(address), .CE(ce1), .UB(ub1), .LB(lb1), .OE(oe1), .WE(we1));
	
endmodule