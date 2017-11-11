
//-------------------------------------------------------------------------
//    Vessel.sv                                                          --
//    Modified from Ball.sv by Viral Mehta                               --                              
//    Modified by Kourosh Arasteh  05-03-2017                            --
//                                                                       --
//-------------------------------------------------------------------------


module  vessel ( input         Reset, 
                             frame_clk, Clk,         // The clock indicating a new frame (~60Hz)
					input		[15:0] keycode,
					input		[1:0]  state, 
					input    [2:0]  curplan,
					input		integer Planet1X, Planet1Y, Planet1S, Planet1M,
					input		integer Planet2X, Planet2Y, Planet2S, Planet2M,
					input		integer Planet3X, Planet3Y, Planet3S, Planet3M,
					input		integer Planet4X, Planet4Y, Planet4S, Planet4M,
					input		integer Planet5X, Planet5Y, Planet5S, Planet5M,
					input		integer Planet6X, Planet6Y, Planet6S, Planet6M,
					input		integer Planet7X, Planet7Y, Planet7S, Planet7M,
					input		integer Planet8X, Planet8Y, Planet8S, Planet8M,
					input    integer Ast1X, Ast1Y, Ast1S, Ast2X, Ast2Y, Ast2S,
					input    integer Ast3X, Ast3Y, Ast3S, Ast4X, Ast4Y, Ast4S,
					input    integer Ast5X, Ast5Y, Ast5S, Ast6X, Ast6Y, Ast6S,
					input    integer Ast7X, Ast7Y, Ast7S, Ast8X, Ast8Y, Ast8S,
					input    integer Ast9X, Ast9Y, Ast9S, Ast10X, Ast10Y, Ast10S,
					input    integer Ast11X, Ast11Y, Ast11S, Ast12X, Ast12Y, Ast12S,
					input    integer Ast13X, Ast13Y, Ast13S, Ast14X, Ast14Y, Ast14S,
					input    integer Ast15X, Ast15Y, Ast15S, Ast16X, Ast16Y, Ast16S,
					input    integer Ast17X, Ast17Y, Ast17S, Ast18X, Ast18Y, Ast18S,
					input    integer Ast19X, Ast19Y, Ast19S, Ast20X, Ast20Y, Ast20S,
					input    integer Ast21X, Ast21Y, Ast21S, Ast22X, Ast22Y, Ast22S,
					input    integer Ast23X, Ast23Y, Ast23S, Ast24X, Ast24Y, Ast24S,
					output   integer moonx, moony, moons,
					input 	integer moontheta,
					input    integer sin, cos, theta,
					output   integer thetaout, thetaoutmoon,
					input    integer sinmoon, cosmoon,
					output logic crash, win,
               output integer  VesselX, VesselY, VesselS // Vessel coordinates and size
              );
    //integer oldx, oldy, newx, newy;
	 //reduce nonfat(.*);
    integer Vessel_X_Pos, Vessel_X_Motion, Vessel_Y_Pos, Vessel_Y_Motion;
    integer Vessel_X_Pos_in, Vessel_X_Motion_in, Vessel_Y_Pos_in, Vessel_Y_Motion_in;
	 integer moon_x_pos, moon_y_pos, moon_x_pos_in, moon_y_pos_in;
    parameter integer Vessel_X_Center=50;  // Center position on the X axis
    parameter integer Vessel_Y_Center=50;  // Center position on the Y axis
    parameter integer Vessel_X_Min=0;       // Leftmost point on the X axis
    parameter integer Vessel_X_Max=639;     // Rightmost point on the X axis
    parameter integer Vessel_Y_Min=0;       // Topmost point on the Y axis
    parameter integer Vessel_Y_Max=479;     // Bottommost point on the Y axis
    parameter integer Vessel_X_Step=1;      // Step size on the X axis
    parameter integer Vessel_Y_Step=1;      // Step size on the Y axis
    parameter integer Vessel_Size=2;        // Vessel size
	 parameter integer moon_size = 5;
    parameter integer moon_x_start = 506;
	 parameter integer moon_y_start = 110;
    assign VesselX = Vessel_X_Pos;
    assign VesselY = Vessel_Y_Pos;
    assign VesselS = Vessel_Size;
    assign moonx = moon_x_pos;
	 assign moony = moon_y_pos;
	 assign moons = moon_size;
    always_ff @ (posedge frame_clk or posedge Reset)
		begin
        if (Reset)
				begin
					Vessel_X_Pos <= Vessel_X_Center;
					Vessel_Y_Pos <= Vessel_Y_Center;
					Vessel_X_Motion <= 0;
					Vessel_Y_Motion <= 0;
					moon_x_pos <= moon_x_start;
					moon_y_pos <= moon_y_start;
				end
      /*  else if (splode == 1'b1)
				begin
					Vessel_X_Pos<= Vessel_X_Pos;
					Vessel_Y_Pos <= Vessel_Y_Pos;
					VesselXAccel <= 10'd0;
					VesselYAccel <= 10'd0;
					Vessel_X_Motion <= 10'd0;
					Vessel_Y_Motion <= 10'd0;
				end										*/			
		  else
				begin
					Vessel_X_Pos <= Vessel_X_Pos_in;
					Vessel_Y_Pos <= Vessel_Y_Pos_in;
					Vessel_X_Motion <= Vessel_X_Motion_in;
					Vessel_Y_Motion <= Vessel_Y_Motion_in;
					moon_x_pos <= moon_x_pos_in;
					moon_y_pos <= moon_y_pos_in;
				end  
		end
    
    always_comb
		begin
		  case(state)
		  2'b00:             //bound
				begin
					thetaout = (theta + 1)%360;
					crash = 1'b0;
					//oldx = 0 - sin;
					//oldy = 0 + cos;
					case(curplan)
						3'b000:			//current planet is planet 1
						begin
							Vessel_X_Pos_in = Planet1X + 2 * cos;
							Vessel_Y_Pos_in = Planet1Y + 2 * sin;
						end
						3'b001:
						begin				//current planet is planet 2
							Vessel_X_Pos_in = Planet2X + 2 * cos * Planet2S/10;
							Vessel_Y_Pos_in = Planet2Y + 2 * sin * Planet2S/10;
						end
						3'b010:
						begin				//current planet is planet 3
							Vessel_X_Pos_in = Planet3X + 2 * cos * Planet3S/10;
							Vessel_Y_Pos_in = Planet3Y + 2 * sin * Planet3S/10;
						end
						3'b011:
						begin				//current planet is planet 4
							Vessel_X_Pos_in = Planet4X + 2 * cos * Planet4S/10;
							Vessel_Y_Pos_in = Planet4Y + 2 * sin * Planet4S/10;
						end
						3'b100:
						begin				//current planet is planet 5
							Vessel_X_Pos_in = Planet5X + 2 * cos * Planet5S/10;
							Vessel_Y_Pos_in = Planet5Y + 2 * sin * Planet5S/10;
						end
						3'b101:
						begin				//current planet is planet 6
							Vessel_X_Pos_in = Planet6X + 2 * cos * Planet6S/10;
							Vessel_Y_Pos_in = Planet6Y + 2 * sin * Planet6S/10;
						end
						3'b110:
						begin				//current planet is planet 7
							Vessel_X_Pos_in = Planet7X + 2 * cos * Planet7S/10;
							Vessel_Y_Pos_in = Planet7Y + 2 * sin * Planet7S/10;
						end
						3'b111:
						begin				//current planet is planet 8
							Vessel_X_Pos_in = Planet8X + 2 * cos * Planet8S/10;
							Vessel_Y_Pos_in = Planet8Y + 2 * sin * Planet8S/10;
						end
						default:			//error state
						begin
							Vessel_X_Pos_in = 600;
							Vessel_Y_Pos_in = 400;
						end
					endcase
					Vessel_X_Motion_in = Vessel_X_Motion;
					Vessel_Y_Motion_in = Vessel_Y_Motion;
				end
		  2'b01:             //leaving
				begin
					crash = 1'b0;
					thetaout = theta % 360;
				//	oldx = 0 - sin;
				//	oldy = 0 + cos;
					Vessel_X_Motion_in = 0 - sin;
					Vessel_Y_Motion_in = 0 + cos;
					Vessel_X_Pos_in = Vessel_X_Pos + (Vessel_X_Motion_in/2);
					Vessel_Y_Pos_in = Vessel_Y_Pos + (Vessel_Y_Motion_in/2);
					
				end
		  2'b10:             //unbound
				begin
				if( Vessel_Y_Pos + Vessel_Size >= Vessel_Y_Max )  // Vessel is at the bottom edge, BOUNCE!
					begin
						Vessel_Y_Motion_in = 0;  // 2's complement.  
						Vessel_X_Motion_in = 0;
						Vessel_X_Pos_in = 0;
						Vessel_Y_Pos_in = 0;
						thetaout = theta % 360;
						crash = 1'b1;
						//oldx = 0 - sin;
						//oldy = 0 + cos;
					end
				else if ( Vessel_Y_Pos <= Vessel_Y_Min + Vessel_Size )  // Vessel is at the top edge, BOUNCE!
					begin
						Vessel_Y_Motion_in = 0;  // 2's complement.  
						Vessel_X_Motion_in = 0;
						Vessel_X_Pos_in = 0;
						Vessel_Y_Pos_in = 0;
						thetaout = theta % 360;
						crash = 1'b1;
						//oldx = 0 - sin;
						//oldy = 0 + cos;
					end
				else if ( Vessel_X_Pos <= Vessel_X_Min + Vessel_Size )  // Vessel is at the top edge, BOUNCE!
					begin
						Vessel_Y_Motion_in = 0;  // 2's complement.  
						Vessel_X_Motion_in = 0;
						Vessel_X_Pos_in = 0;
						Vessel_Y_Pos_in = 0;
						thetaout = theta % 360;
						crash = 1'b1;
						//oldx = 0 - sin;
						//oldy = 0 + cos;
					end
				else if( Vessel_X_Pos + Vessel_Size >= Vessel_X_Max )  // Vessel is at the bottom edge, BOUNCE!
					begin
						Vessel_Y_Motion_in = 0;  // 2's complement.  
						Vessel_X_Motion_in = 0;
						Vessel_X_Pos_in = 0;
						Vessel_Y_Pos_in = 0;
						thetaout = theta % 360;
						crash = 1'b1;						
						//oldx = 0 - sin;
						//oldy = 0 + cos;
					end
				else if((((Ast1X - VesselX)**2 + (Ast1Y - VesselY)**2) <= ((Ast1S + Vessel_Size)**2)) || 
						  (((Ast2X - VesselX)**2 + (Ast2Y - VesselY)**2) <= ((Ast2S + Vessel_Size)**2)) ||
						  (((Ast3X - VesselX)**2 + (Ast3Y - VesselY)**2) <= ((Ast3S + Vessel_Size)**2)) ||
						  (((Ast4X - VesselX)**2 + (Ast4Y - VesselY)**2) <= ((Ast4S + Vessel_Size)**2)) ||
						  (((Ast5X - VesselX)**2 + (Ast5Y - VesselY)**2) <= ((Ast5S + Vessel_Size)**2)) ||
						  (((Ast6X - VesselX)**2 + (Ast6Y - VesselY)**2) <= ((Ast6S + Vessel_Size)**2)) ||
						  (((Ast7X - VesselX)**2 + (Ast7Y - VesselY)**2) <= ((Ast7S + Vessel_Size)**2)) ||
						  (((Ast8X - VesselX)**2 + (Ast8Y - VesselY)**2) <= ((Ast8S + Vessel_Size)**2)) ||
						  (((Ast9X - VesselX)**2 + (Ast9Y - VesselY)**2) <= ((Ast9S + Vessel_Size)**2)) || 
						  (((Ast10X - VesselX)**2 + (Ast10Y - VesselY)**2) <= ((Ast10S + Vessel_Size)**2)) ||
						  (((Ast11X - VesselX)**2 + (Ast11Y - VesselY)**2) <= ((Ast11S + Vessel_Size)**2)) ||
						  (((Ast12X - VesselX)**2 + (Ast12Y - VesselY)**2) <= ((Ast12S + Vessel_Size)**2)) ||
						  (((Ast13X - VesselX)**2 + (Ast13Y - VesselY)**2) <= ((Ast13S + Vessel_Size)**2)) ||
						  (((Ast14X - VesselX)**2 + (Ast14Y - VesselY)**2) <= ((Ast14S + Vessel_Size)**2)) ||
						  (((Ast15X - VesselX)**2 + (Ast15Y - VesselY)**2) <= ((Ast15S + Vessel_Size)**2)) ||
						  (((Ast16X - VesselX)**2 + (Ast16Y - VesselY)**2) <= ((Ast16S + Vessel_Size)**2)) ||
						  (((Ast17X - VesselX)**2 + (Ast17Y - VesselY)**2) <= ((Ast17S + Vessel_Size)**2)) ||
						  (((Ast18X - VesselX)**2 + (Ast18Y - VesselY)**2) <= ((Ast18S + Vessel_Size)**2)) ||
						  (((Ast19X - VesselX)**2 + (Ast19Y - VesselY)**2) <= ((Ast19S + Vessel_Size)**2)) ||
						  (((Ast20X - VesselX)**2 + (Ast20Y - VesselY)**2) <= ((Ast20S + Vessel_Size)**2)) ||
						  (((Ast21X - VesselX)**2 + (Ast21Y - VesselY)**2) <= ((Ast21S + Vessel_Size)**2)) ||
						  (((Ast22X - VesselX)**2 + (Ast22Y - VesselY)**2) <= ((Ast22S + Vessel_Size)**2)) ||
						  (((Ast23X - VesselX)**2 + (Ast23Y - VesselY)**2) <= ((Ast23S + Vessel_Size)**2)) ||
						  (((Ast24X - VesselX)**2 + (Ast24Y - VesselY)**2) <= ((Ast24S + Vessel_Size)**2)) ||
						  (((moonx - VesselX)**2  + (moony - VesselY)**2) <= ((moons + Vessel_Size)**2)))
					begin
						Vessel_Y_Motion_in = 0;  // 2's complement.  
						Vessel_X_Motion_in = 0;
						Vessel_X_Pos_in = Vessel_X_Pos;
						Vessel_Y_Pos_in = Vessel_Y_Pos;
						thetaout = theta % 360;
						crash = 1'b1;								
					end
				else
					begin
						Vessel_X_Motion_in = Vessel_X_Motion;
						Vessel_Y_Motion_in = Vessel_Y_Motion;
						Vessel_X_Pos_in = Vessel_X_Pos + Vessel_X_Motion;
						Vessel_Y_Pos_in = Vessel_Y_Pos + Vessel_Y_Motion;
						thetaout = theta;
						crash = 1'b0;
						//oldx = 0 - sin;
						//oldy = 0 + cos;
					end
				end
		  
		  2'b11:             //arriving
				begin
						crash = 1'b0;
						thetaout = theta % 360;
						//oldx = 0 - sin;
						//oldy = 0 + cos;
						Vessel_X_Motion_in = Vessel_X_Motion;
						Vessel_Y_Motion_in = Vessel_Y_Motion;
						
						case(curplan)
						3'b000:			//current planet is planet 1
						begin
							Vessel_X_Pos_in = Planet1X + 2 * Planet1S;
							Vessel_Y_Pos_in = Planet1Y;
						end
						3'b001:
						begin				//current planet is planet 2
							Vessel_X_Pos_in = Planet2X + 2 * Planet2S;
							Vessel_Y_Pos_in = Planet2Y;
						end
						3'b010:
						begin				//current planet is planet 3
							Vessel_X_Pos_in = Planet3X + 2 * Planet3S;
							Vessel_Y_Pos_in = Planet3Y;
						end
						3'b011:
						begin				//current planet is planet 4
							Vessel_X_Pos_in = Planet4X + 2 * Planet4S;
							Vessel_Y_Pos_in = Planet4Y;
						end
						3'b100:
						begin				//current planet is planet 5
							Vessel_X_Pos_in = Planet5X + 2 * Planet5S;
							Vessel_Y_Pos_in = Planet5Y;
						end
						3'b101:
						begin				//current planet is planet 6
							Vessel_X_Pos_in = Planet6X + 2 * Planet6S;
							Vessel_Y_Pos_in = Planet6Y;
						end
						3'b110:
						begin				//current planet is planet 7
							Vessel_X_Pos_in = Planet7X + 2 * Planet7S;
							Vessel_Y_Pos_in = Planet7Y;
						end
						3'b111:
						begin				//current planet is planet 8
							Vessel_X_Pos_in = Planet8X + 2 * Planet8S;
							Vessel_Y_Pos_in = Planet8Y;
						end
						default:
						begin				//error state
							Vessel_X_Pos_in = 10;
							Vessel_Y_Pos_in = 400;
						end
					endcase
				end
		  endcase
		  thetaoutmoon = (moontheta + 2) %360;
		  moon_x_pos_in = Planet6X + 6* cosmoon;
		  moon_y_pos_in = Planet6Y + 6*sinmoon;
		  win = (curplan == 3'b100);
		end
    
endmodule
  