//-------------------------------------------------------------------------
//    orbitmachine.sv                                                    --
//    Written by Kourosh Arasteh  05-03-2017                             --
//                                                                       --
//-------------------------------------------------------------------------
module orbitmachine(	input frame_clk, 
							input Reset, 
							input logic [15:0] keycode,
							input		integer Planet1X, Planet1Y, Planet1S, Planet1M,
							input		integer Planet2X, Planet2Y, Planet2S, Planet2M,
							input		integer Planet3X, Planet3Y, Planet3S, Planet3M,
							input		integer Planet4X, Planet4Y, Planet4S, Planet4M,
							input		integer Planet5X, Planet5Y, Planet5S, Planet5M,
							input		integer Planet6X, Planet6Y, Planet6S, Planet6M,
							input		integer Planet7X, Planet7Y, Planet7S, Planet7M,
							input		integer Planet8X, Planet8Y, Planet8S, Planet8M,
							input		integer VesselX, VesselY, VesselS,
							output	logic [1:0] state,
							output   logic [2:0] curplan,
							output   logic welcomepage,
							output   integer theta, moontheta
							);
		integer prevtheta, prevmoontheta;
		logic [2:0] latchcurplan;
		initial latchcurplan = 3'b111;
		initial prevtheta = 0;
		initial prevmoontheta = 0;
		
		enum logic [1:0] {bound, unbound, arriving, leaving} curr_state, next_state;
		enum logic {startpage, game} curr_page, next_page;
		always_ff @ (posedge frame_clk or posedge Reset)
		begin
			if (Reset)
				begin
					curr_state = arriving;
					curr_page = startpage;
					prevtheta = 0;
					prevmoontheta = 0;
					latchcurplan = 3'b111;
				end
			else
				begin
					curr_page = next_page;
					curr_state = next_state;
					prevtheta = theta;
					prevmoontheta = moontheta;
					latchcurplan = curplan;
				end
		end
		
		always_comb
		begin
			unique case(curr_page)
			startpage:
				begin
					welcomepage = 1'b1;
					if(keycode == 16'h0028)
						begin
						next_page <= game;
						end
					else
						next_page <= startpage;
				end
			game:
				begin
					welcomepage = 1'b0;
					if(Reset)
						begin
						next_page <= startpage;
						end
					else
						next_page <= game;
				end
			endcase
			unique case(curr_state)
		   bound:
				begin
					curplan <= latchcurplan;
					state <= 2'b00;
					if(keycode == 16'h002C)
						begin
							next_state <= leaving;
							theta <= prevtheta;
							
						end
					else
						begin
							next_state <= bound;
							theta <= prevtheta + 1;
						end
				end
			leaving:
				begin
					state <= 2'b01;
					next_state <= unbound;
					theta <= prevtheta;
					curplan <= latchcurplan;
				end
			unbound:
				begin
					state = 2'b10;
					if(((Planet1X - VesselX)**2 + (Planet1Y - VesselY)**2) <= ((Planet1S + VesselS)**2))
					begin
							curplan <= 3'b000;
							next_state <= arriving;
					end
					else if(((Planet2X - VesselX)**2 + (Planet2Y - VesselY)**2) <= ((Planet2S + VesselS)**2))
					begin
							curplan <= 3'b001;
							next_state <= arriving;
					end
					else if(((Planet3X - VesselX)**2 + (Planet3Y - VesselY)**2) <= ((Planet3S + VesselS)**2))
					begin
							curplan <= 3'b010;
							next_state <= arriving;
					end
					else if(((Planet4X - VesselX)**2 + (Planet4Y - VesselY)**2) <= ((Planet4S + VesselS)**2))
					begin
							curplan <= 3'b011;
							next_state <= arriving;
					end
					else if(((Planet5X - VesselX)**2 + (Planet5Y - VesselY)**2) <= ((Planet5S + VesselS)**2))
					begin
							curplan <= 3'b100;
							next_state <= arriving;
					end
					else if(((Planet6X - VesselX)**2 + (Planet6Y - VesselY)**2) <= ((Planet6S + VesselS)**2))
					begin
							curplan <= 3'b101;
							next_state <= arriving;
					end
					else if(((Planet7X - VesselX)**2 + (Planet7Y - VesselY)**2) <= ((Planet7S + VesselS)**2))
					begin
							curplan <= 3'b110;
							next_state <= arriving;
					end
					else if(((Planet8X - VesselX)**2 + (Planet8Y - VesselY)**2) <= ((Planet8S + VesselS)**2))
					begin
							curplan <= 3'b111;
							next_state <= arriving;
					end
					else
					begin
							next_state <= unbound;
							curplan <= 3'b111;
					end
					theta <= prevtheta;
				end
			arriving:
				begin
					state <= 2'b11;
					theta <= 0;
					next_state <= bound;
					curplan <= latchcurplan;
				end
			endcase
			moontheta <= prevmoontheta+2;
		end
		
		
endmodule