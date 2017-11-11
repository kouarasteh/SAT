//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  03-03-2017                               --
//    Modified by Kourosh Arasteh 05-03-2017                             --
//    Spring 2017 Distribution                                           --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        integer VesselX, VesselY,       // Ball coordinates
                                          VesselS,              // Ball size (defined in ball.sv)
														Planet1X, Planet1Y,
														Planet1S,
														Planet2X, Planet2Y,
														Planet2S,
														Planet3X, Planet3Y,
														Planet3S,
														Planet4X, Planet4Y,
														Planet4S,
														Planet5X, Planet5Y,
														Planet5S,
														Planet6X, Planet6Y,
														Planet6S,
														Planet7X, Planet7Y,
														Planet7S,
														Planet8X, Planet8Y,
														Planet8S,
														Ast1X, Ast1Y, Ast1S,
														Ast2X, Ast2Y, Ast2S,
														Ast3X, Ast3Y, Ast3S,
														Ast4X, Ast4Y, Ast4S,
														Ast5X, Ast5Y, Ast5S,
														Ast6X, Ast6Y, Ast6S,
														Ast7X, Ast7Y, Ast7S,
														Ast8X, Ast8Y, Ast8S,
														Ast9X, Ast9Y, Ast9S,
														Ast10X, Ast10Y, Ast10S,
														Ast11X, Ast11Y, Ast11S,
														Ast12X, Ast12Y, Ast12S,
														Ast13X, Ast13Y, Ast13S,
														Ast14X, Ast14Y, Ast14S,
														Ast15X, Ast15Y, Ast15S,
														Ast16X, Ast16Y, Ast16S,
														Ast17X, Ast17Y, Ast17S,
														Ast18X, Ast18Y, Ast18S,
														Ast19X, Ast19Y, Ast19S,
														Ast20X, Ast20Y, Ast20S,
														Ast21X, Ast21Y, Ast21S,
														Ast22X, Ast22Y, Ast22S,
														Ast23X, Ast23Y, Ast23S,
														Ast24X, Ast24Y, Ast24S,
														moonx, moony, moons,
							  input 					crash, welcomepage, win,
                       input integer      DrawX, DrawY,       // Coordinates of current drawing pixel
                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
    
    
    logic vessel_on, plan1_on, plan2_on, plan3_on, plan4_on, plan5_on, plan6_on, plan7_on, plan8_on, 
			ast1_on, ast2_on, ast3_on, ast4_on, ast5_on, ast6_on, ast7_on, ast8_on,
			ast9_on, ast10_on, ast11_on, ast12_on, ast13_on, ast14_on, ast15_on, ast16_on,
			ast17_on, ast18_on, ast19_on, ast20_on, ast21_on, ast22_on, ast23_on, ast24_on, moon_on,
			gameover1_on, gameover2_on, gameover3_on, gameover4_on, gameover5_on, gameover6_on, gameover7_on, gameover8_on,
			welcome1_on,welcome2_on,welcome3_on,welcome4_on,welcome5_on,welcome6_on,welcome7_on,welcome8_on,welcome9_on,
			welcome10_on,welcome11_on,welcome12_on,welcome13_on,welcome14_on,welcome15_on,welcome16_on,welcome17_on;
    
	 logic [7:0] Red, Green, Blue;
	 
	 logic [10:0] gameover1_onX = 195;	
 	 logic [10:0] gameover2_onX = 203;
    logic [10:0] gameover3_onX = 211;
	 logic [10:0] gameover4_onX = 219;
	 logic [10:0] gameover5_onX = 235;
	 logic [10:0] gameover6_onX = 243;
	 logic [10:0] gameover7_onX = 251;
	 logic [10:0] gameover8_onX = 259;
	 
	 logic [10:0] gameover1_onY = 100;
	 logic [10:0] gameover2_onY = 100;
	 logic [10:0] gameover3_onY = 100;
	 logic [10:0] gameover4_onY = 100;
	 logic [10:0] gameover5_onY = 100;
	 logic [10:0] gameover6_onY = 100;
	 logic [10:0] gameover7_onY = 100;
	 logic [10:0] gameover8_onY = 100;
	 
	 logic [10:0] gameover1_onXsz = 8;
	 logic [10:0] gameover2_onXsz = 8;
	 logic [10:0] gameover3_onXsz = 8;
	 logic [10:0] gameover4_onXsz = 8;
	 logic [10:0] gameover5_onXsz = 8;
	 logic [10:0] gameover6_onXsz = 8;
	 logic [10:0] gameover7_onXsz = 8;
	 logic [10:0] gameover8_onXsz = 8;
	 
	 logic [10:0] gameover1_onYsz = 16;
	 logic [10:0] gameover2_onYsz = 16;
	 logic [10:0] gameover3_onYsz = 16;
	 logic [10:0] gameover4_onYsz = 16;
	 logic [10:0] gameover5_onYsz = 16;
	 logic [10:0] gameover6_onYsz = 16;
	 logic [10:0] gameover7_onYsz = 16;
	 logic [10:0] gameover8_onYsz = 16;
	 
	 logic [10:0] welcome1_onX = 195;
	 logic [10:0] welcome2_onX = 203;
	 logic [10:0] welcome3_onX = 211;
	 logic [10:0] welcome4_onX = 219;
	 logic [10:0] welcome5_onX = 227;
	 logic [10:0] welcome6_onX = 243;
	 logic [10:0] welcome7_onX = 251;
	 logic [10:0] welcome8_onX = 259;
	 logic [10:0] welcome9_onX = 267;
	 logic [10:0] welcome10_onX = 275;
	 logic [10:0] welcome11_onX = 291;
	 logic [10:0] welcome12_onX = 299;
	 logic [10:0] welcome13_onX = 315;
	 logic [10:0] welcome14_onX = 323;
	 logic [10:0] welcome15_onX = 331;
	 logic [10:0] welcome16_onX = 339;
	 logic [10:0] welcome17_onX = 347;
	 
	 logic [10:0] welcome1_onY = 460;
	 logic [10:0] welcome2_onY = 460;
	 logic [10:0] welcome3_onY = 460;
	 logic [10:0] welcome4_onY = 460;
	 logic [10:0] welcome5_onY = 460;
	 logic [10:0] welcome6_onY = 460;
	 logic [10:0] welcome7_onY = 460;
	 logic [10:0] welcome8_onY = 460;
	 logic [10:0] welcome9_onY = 460;
	 logic [10:0] welcome10_onY = 460;
	 logic [10:0] welcome11_onY = 460;
	 logic [10:0] welcome12_onY = 460;
	 logic [10:0] welcome13_onY= 460;
	 logic [10:0] welcome14_onY = 460;
	 logic [10:0] welcome15_onY = 460;
	 logic [10:0] welcome16_onY = 460;
	 logic [10:0] welcome17_onY = 460;
	 
	 logic [10:0] welcome1_onXsz = 8;
	 logic [10:0] welcome2_onXsz = 8;
	 logic [10:0] welcome3_onXsz = 8;
	 logic [10:0] welcome4_onXsz = 8;
	 logic [10:0] welcome5_onXsz = 8;
	 logic [10:0] welcome6_onXsz = 8;
	 logic [10:0] welcome7_onXsz = 8;
	 logic [10:0] welcome8_onXsz = 8;
	 logic [10:0] welcome9_onXsz = 8;
	 logic [10:0] welcome10_onXsz = 8;
	 logic [10:0] welcome11_onXsz = 8;
	 logic [10:0] welcome12_onXsz = 8;
	 logic [10:0] welcome13_onXsz = 8;
	 logic [10:0] welcome14_onXsz = 8;
	 logic [10:0] welcome15_onXsz = 8;
	 logic [10:0] welcome16_onXsz = 8;
	 logic [10:0] welcome17_onXsz = 8;
	 
	 logic [10:0] welcome1_onYsz = 16;
	 logic [10:0] welcome2_onYsz = 16;
	 logic [10:0] welcome3_onYsz = 16;
	 logic [10:0] welcome4_onYsz = 16;
	 logic [10:0] welcome5_onYsz = 16;
	 logic [10:0] welcome6_onYsz = 16;
	 logic [10:0] welcome7_onYsz = 16;
	 logic [10:0] welcome8_onYsz = 16;
	 logic [10:0] welcome9_onYsz = 16;
	 logic [10:0] welcome10_onYsz = 16;
	 logic [10:0] welcome11_onYsz = 16;
	 logic [10:0] welcome12_onYsz = 16;
	 logic [10:0] welcome13_onYsz = 16;
	 logic [10:0] welcome14_onYsz = 16;
	 logic [10:0] welcome15_onYsz = 16;
	 logic [10:0] welcome16_onYsz = 16;
	 logic [10:0] welcome17_onYsz = 16;

	 
	 logic [10:0] sprite_addr;
	 logic [7:0]  sprite_data;
	 
	 font_rom text(.addr(sprite_addr), .data(sprite_data));
 /* The ball's (pixelated) circle is generated using the standard circle formula.  Note that while 
    the single line is quite powerful descriptively, it causes the synthesis tool to use up three
    of the 12 available multipliers on the chip! Since the multiplicants are required to be signed,
    we have to first cast them from logic to int (signed by default) before they are multiplied. */
      
    int Dist1X, Dist1Y, Plan1Size, Dist2X, Dist2Y, Plan2Size, DistBX, DistBY, VesselSize,
		  Dist3X, Dist3Y, Plan3Size, Dist4X, Dist4Y, Plan4Size,
		  Dist5X, Dist5Y, Plan5Size, Dist6X, Dist6Y, Plan6Size,
		  Dist7X, Dist7Y, Plan7Size, Dist8X, Dist8Y, Plan8Size,
		  DistA1X, DistA1Y, Asteroid1S, DistA2X, DistA2Y, Asteroid2S,
		  DistA3X, DistA3Y, Asteroid3S, DistA4X, DistA4Y, Asteroid4S,
		  DistA5X, DistA5Y, Asteroid5S, DistA6X, DistA6Y, Asteroid6S,
		  DistA7X, DistA7Y, Asteroid7S, DistA8X, DistA8Y, Asteroid8S,
		  DistA9X, DistA9Y, Asteroid9S, DistA10X, DistA10Y, Asteroid10S,
		  DistA11X, DistA11Y, Asteroid11S, DistA12X, DistA12Y, Asteroid12S,
		  DistA13X, DistA13Y, Asteroid13S, DistA14X, DistA14Y, Asteroid14S,
		  DistA15X, DistA15Y, Asteroid15S, DistA16X, DistA16Y, Asteroid16S,
		  DistA17X, DistA17Y, Asteroid17S, DistA18X, DistA18Y, Asteroid18S,
		  DistA19X, DistA19Y, Asteroid19S, DistA20X, DistA20Y, Asteroid20S,
		  DistA21X, DistA21Y, Asteroid21S, DistA22X, DistA22Y, Asteroid22S,
		  DistA23X, DistA23Y, Asteroid23S, DistA24X, DistA24Y, Asteroid24S,
		  DistMoonX, DistMoonY, MoonSize;
		  
    assign Dist1X = DrawX - Planet1X;
    assign Dist1Y = DrawY - Planet1Y;
    assign Plan1Size = Planet1S;
    
	 assign Dist2X = DrawX - Planet2X;
    assign Dist2Y = DrawY - Planet2Y;
    assign Plan2Size = Planet2S;
    
	 assign Dist3X = DrawX - Planet3X;
    assign Dist3Y = DrawY - Planet3Y;
    assign Plan3Size = Planet3S;
	 
	 assign Dist4X = DrawX - Planet4X;
    assign Dist4Y = DrawY - Planet4Y;
    assign Plan4Size = Planet4S;
	 
	 assign Dist5X = DrawX - Planet5X;
    assign Dist5Y = DrawY - Planet5Y;
    assign Plan5Size = Planet5S;
	 
	 assign Dist6X = DrawX - Planet6X;
    assign Dist6Y = DrawY - Planet6Y;
    assign Plan6Size = Planet6S;
	 
	 assign Dist7X = DrawX - Planet7X;
    assign Dist7Y = DrawY - Planet7Y;
    assign Plan7Size = Planet7S;
	 
	 assign Dist8X = DrawX - Planet8X;
    assign Dist8Y = DrawY - Planet8Y;
    assign Plan8Size = Planet8S;
	 
	 assign DistA1X = DrawX - Ast1X;
	 assign DistA1Y = DrawY - Ast1Y;
	 assign Asteroid1S = Ast1S;
	 
	 assign DistA2X = DrawX - Ast2X;
	 assign DistA2Y = DrawY - Ast2Y;
	 assign Asteroid2S = Ast2S;
	 
	 assign DistA3X = DrawX - Ast3X;
	 assign DistA3Y = DrawY - Ast3Y;
	 assign Asteroid3S = Ast3S;
	 
	 assign DistA4X = DrawX - Ast4X;
	 assign DistA4Y = DrawY - Ast4Y;
	 assign Asteroid4S = Ast4S;
	 
	 assign DistA5X = DrawX - Ast5X;
	 assign DistA5Y = DrawY - Ast5Y;
	 assign Asteroid5S = Ast5S;
	 
	 assign DistA6X = DrawX - Ast6X;
	 assign DistA6Y = DrawY - Ast6Y;
	 assign Asteroid6S = Ast6S;
	 
	 assign DistA7X = DrawX - Ast7X;
	 assign DistA7Y = DrawY - Ast7Y;
	 assign Asteroid7S = Ast7S;
	 
	 assign DistA8X = DrawX - Ast8X;
	 assign DistA8Y = DrawY - Ast8Y;
	 assign Asteroid8S = Ast8S;
	 
	 assign DistA9X = DrawX - Ast9X;
	 assign DistA9Y = DrawY - Ast9Y;
	 assign Asteroid9S = Ast9S;
	 
	 assign DistA10X = DrawX - Ast10X;
	 assign DistA10Y = DrawY - Ast10Y;
	 assign Asteroid10S = Ast10S;
	 
	 assign DistA11X = DrawX - Ast11X;
	 assign DistA11Y = DrawY - Ast11Y;
	 assign Asteroid11S = Ast11S;
	 
	 assign DistA12X = DrawX - Ast12X;
	 assign DistA12Y = DrawY - Ast12Y;
	 assign Asteroid12S = Ast12S;
	 
	 assign DistA13X = DrawX - Ast13X;
	 assign DistA13Y = DrawY - Ast13Y;
	 assign Asteroid13S = Ast13S;
	 
	 assign DistA14X = DrawX - Ast14X;
	 assign DistA14Y = DrawY - Ast14Y;
	 assign Asteroid14S = Ast14S;
	 
	 assign DistA15X = DrawX - Ast15X;
	 assign DistA15Y = DrawY - Ast15Y;
	 assign Asteroid15S = Ast15S;
	 
	 assign DistA16X = DrawX - Ast16X;
	 assign DistA16Y = DrawY - Ast16Y;
	 assign Asteroid16S = Ast16S;
	 
	 assign DistA17X = DrawX - Ast17X;
	 assign DistA17Y = DrawY - Ast17Y;
	 assign Asteroid17S = Ast17S;
	 
	 assign DistA18X = DrawX - Ast18X;
	 assign DistA18Y = DrawY - Ast18Y;
	 assign Asteroid18S = Ast18S;
	 
	 assign DistA19X = DrawX - Ast19X;
	 assign DistA19Y = DrawY - Ast19Y;
	 assign Asteroid19S = Ast19S;
	 
	 assign DistA20X = DrawX - Ast20X;
	 assign DistA20Y = DrawY - Ast20Y;
	 assign Asteroid20S = Ast20S;
	 
	 assign DistA21X = DrawX - Ast21X;
	 assign DistA21Y = DrawY - Ast21Y;
	 assign Asteroid21S = Ast21S;
	 
	 assign DistA22X = DrawX - Ast22X;
	 assign DistA22Y = DrawY - Ast22Y;
	 assign Asteroid22S = Ast22S;
	 
	 assign DistA23X = DrawX - Ast23X;
	 assign DistA23Y = DrawY - Ast23Y;
	 assign Asteroid23S = Ast23S;
	 
	 assign DistA24X = DrawX - Ast24X;
	 assign DistA24Y = DrawY - Ast24Y;
	 assign Asteroid24S = Ast24S;
	 
	 assign DistMoonX = DrawX - moonx;
	 assign DistMoonY = DrawY - moony;
	 assign MoonSize = moons;
	 
	 assign DistBX = DrawX - VesselX;
    assign DistBY = DrawY - VesselY;
    assign VesselSize = VesselS;
    
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
    
    // Compute whether the pixel corresponds to ball or background
    always_comb
    begin : Ball_on_proc
		plan1_on = 1'b0;
		plan2_on = 1'b0;
		plan3_on = 1'b0;
		plan4_on = 1'b0;
		plan5_on = 1'b0;
		plan6_on = 1'b0;
		plan7_on = 1'b0;
		plan8_on = 1'b0;
		ast1_on = 1'b0;
		ast2_on = 1'b0;
		ast3_on = 1'b0;
		ast4_on = 1'b0;
		ast5_on = 1'b0;
		ast6_on = 1'b0;
		ast7_on = 1'b0;
		ast8_on = 1'b0;
		ast9_on = 1'b0;
		ast10_on = 1'b0;
		ast11_on = 1'b0;
		ast12_on = 1'b0;
		ast13_on = 1'b0;
		ast14_on = 1'b0;
		ast15_on = 1'b0;
		ast16_on = 1'b0;
		ast17_on = 1'b0;
		ast18_on = 1'b0;
		ast19_on = 1'b0;
		ast20_on = 1'b0;
		ast21_on = 1'b0;
		ast22_on = 1'b0;
		ast23_on = 1'b0;
		ast24_on = 1'b0;
		moon_on  = 1'b0;
		vessel_on = 1'b0;
		gameover1_on = 1'b0;
		gameover2_on = 1'b0; 
		gameover3_on = 1'b0; 
		gameover4_on = 1'b0;
		gameover5_on = 1'b0;
		gameover6_on = 1'b0;
		gameover7_on = 1'b0;
		gameover8_on = 1'b0;
		welcome1_on = 1'b0;
		welcome2_on = 1'b0;
		welcome3_on = 1'b0;
		welcome4_on = 1'b0;
		welcome5_on = 1'b0;
		welcome6_on = 1'b0;
		welcome7_on = 1'b0;
		welcome8_on = 1'b0;
		welcome9_on = 1'b0;
		welcome10_on = 1'b0;
		welcome11_on = 1'b0;
		welcome12_on = 1'b0;
		welcome13_on = 1'b0;
		welcome14_on = 1'b0;
		welcome15_on = 1'b0;
		welcome16_on = 1'b0;
		welcome17_on = 1'b0;
		sprite_addr = 10'b0;
		
				//Planets
        if ( ( Dist1X*Dist1X + Dist1Y*Dist1Y) <= (Plan1Size * Plan1Size) ) 
            plan1_on = 1'b1;
        else if ( ( Dist2X*Dist2X + Dist2Y*Dist2Y) <= (Plan2Size * Plan2Size) ) 
            plan2_on = 1'b1;
		  else if ( ( Dist3X*Dist3X + Dist3Y*Dist3Y) <= (Plan3Size * Plan3Size) ) 
            plan3_on = 1'b1;
		  else if ( ( Dist4X*Dist4X + Dist4Y*Dist4Y) <= (Plan4Size * Plan4Size) ) 
            plan4_on = 1'b1;
		  else if ( ( Dist5X*Dist5X + Dist5Y*Dist5Y) <= (Plan5Size * Plan5Size) ) 
            plan5_on = 1'b1;
		  else if ( ( Dist6X*Dist6X + Dist6Y*Dist6Y) <= (Plan6Size * Plan6Size) ) 
            plan6_on = 1'b1;
		  else if ( ( Dist7X*Dist7X + Dist7Y*Dist7Y) <= (Plan7Size * Plan7Size) ) 
            plan7_on = 1'b1;
		  else if ( ( Dist8X*Dist8X + Dist8Y*Dist8Y) <= (Plan8Size * Plan8Size) ) 
            plan8_on = 1'b1;
				//Asteroids
		  else if ( ( DistA2X*DistA2X + DistA2Y*DistA2Y) <= (Asteroid2S * Asteroid2S) ) 
            ast2_on = 1'b1;
		  else if ( ( DistA1X*DistA1X + DistA1Y*DistA1Y) <= (Asteroid1S * Asteroid1S) ) 
            ast1_on = 1'b1;
		  else if ( ( DistA3X*DistA3X + DistA3Y*DistA3Y) <= (Asteroid3S * Asteroid3S) ) 
            ast3_on = 1'b1;
		  else if ( ( DistA4X*DistA4X + DistA4Y*DistA4Y) <= (Asteroid4S * Asteroid4S) ) 
            ast4_on = 1'b1;
		  else if ( ( DistA5X*DistA5X + DistA5Y*DistA5Y) <= (Asteroid5S * Asteroid5S) ) 
            ast5_on = 1'b1;
		  else if ( ( DistA6X*DistA6X + DistA6Y*DistA6Y) <= (Asteroid6S * Asteroid6S) ) 
            ast6_on = 1'b1;
		  else if ( ( DistA7X*DistA7X + DistA7Y*DistA7Y) <= (Asteroid7S * Asteroid7S) ) 
            ast7_on = 1'b1;
		  else if ( ( DistA8X*DistA8X + DistA8Y*DistA8Y) <= (Asteroid8S * Asteroid8S) ) 
            ast8_on = 1'b1;
		  else if ( ( DistA9X*DistA9X + DistA9Y*DistA9Y) <= (Asteroid9S * Asteroid9S) ) 
            ast9_on = 1'b1;
		  else if ( ( DistA10X*DistA10X + DistA10Y*DistA10Y) <= (Asteroid10S * Asteroid10S) ) 
            ast10_on = 1'b1;
		  else if ( ( DistA11X*DistA11X + DistA11Y*DistA11Y) <= (Asteroid11S * Asteroid11S) ) 
            ast11_on = 1'b1;
		  else if ( ( DistA12X*DistA12X + DistA12Y*DistA12Y) <= (Asteroid12S * Asteroid12S) ) 
            ast12_on = 1'b1;
		  else if ( ( DistA13X*DistA13X + DistA13Y*DistA13Y) <= (Asteroid13S * Asteroid13S) ) 
            ast13_on = 1'b1;
		  else if ( ( DistA14X*DistA14X + DistA14Y*DistA14Y) <= (Asteroid14S * Asteroid14S) ) 
            ast14_on = 1'b1;
		  else if ( ( DistA15X*DistA15X + DistA15Y*DistA15Y) <= (Asteroid15S * Asteroid15S) ) 
            ast15_on = 1'b1;
		  else if ( ( DistA16X*DistA16X + DistA16Y*DistA16Y) <= (Asteroid16S * Asteroid16S) ) 
            ast16_on = 1'b1;
		  else if ( ( DistA17X*DistA17X + DistA17Y*DistA17Y) <= (Asteroid17S * Asteroid17S) ) 
            ast17_on = 1'b1;
		  else if ( ( DistA18X*DistA18X + DistA18Y*DistA18Y) <= (Asteroid18S * Asteroid18S) ) 
            ast18_on = 1'b1;
		  else if ( ( DistA19X*DistA19X + DistA19Y*DistA19Y) <= (Asteroid19S * Asteroid19S) ) 
            ast19_on = 1'b1;
		  else if ( ( DistA20X*DistA20X + DistA20Y*DistA20Y) <= (Asteroid20S * Asteroid20S) ) 
            ast20_on = 1'b1;
		  else if ( ( DistA21X*DistA21X + DistA21Y*DistA21Y) <= (Asteroid21S * Asteroid21S) ) 
            ast21_on = 1'b1;
		  else if ( ( DistA22X*DistA22X + DistA22Y*DistA22Y) <= (Asteroid22S * Asteroid22S) ) 
            ast22_on = 1'b1;
		  else if ( ( DistA23X*DistA23X + DistA23Y*DistA23Y) <= (Asteroid23S * Asteroid23S) ) 
            ast23_on = 1'b1;
		  else if ( ( DistA24X*DistA24X + DistA24Y*DistA24Y) <= (Asteroid24S * Asteroid24S) )
				//moon
            ast24_on = 1'b1;
		  else if ( ( DistMoonX*DistMoonX + DistMoonY*DistMoonY) <= (MoonSize * MoonSize) ) 
            moon_on = 1'b1;
				//fonts
		  else if ((DrawX >= gameover1_onX) && (DrawX < gameover1_onX + gameover1_onXsz) &&
					  (DrawY >= gameover1_onY) && (DrawY < gameover1_onY + gameover1_onYsz))
					 begin 
						gameover1_on = 1'b1;
						sprite_addr = (DrawY - gameover1_onY + 16*'h47);//G
						if(win)
							sprite_addr = (DrawY - gameover1_onY + 16*'h57);//W

					 end
			else if ((DrawX >= gameover2_onX) && (DrawX < gameover2_onX + gameover2_onXsz) &&
					  (DrawY >= gameover2_onY) && (DrawY < gameover2_onY + gameover2_onYsz))
					 begin 
						gameover2_on = 1'b1;
						sprite_addr = (DrawY - gameover2_onY + 16*'h41);//A
						if(win)
							sprite_addr = (DrawY - gameover1_onY + 16*'h45);//E
					 end
			else if ((DrawX >= gameover3_onX) && (DrawX < gameover3_onX + gameover3_onXsz) &&
					  (DrawY >= gameover3_onY) && (DrawY < gameover3_onY + gameover3_onYsz))
					 begin 
						gameover3_on = 1'b1;
						sprite_addr = (DrawY - gameover3_onY + 16*'h4d);//M
						if(win)
							sprite_addr = (DrawY - gameover1_onY + 16*'h4c);//L
					 end
			else if ((DrawX >= gameover4_onX) && (DrawX < gameover4_onX + gameover4_onXsz) &&
					  (DrawY >= gameover4_onY) && (DrawY < gameover4_onY + gameover4_onYsz))
					 begin 
						gameover4_on = 1'b1;
						sprite_addr = (DrawY - gameover4_onY + 16*'h45);//E
						if(win)
							sprite_addr = (DrawY - gameover1_onY + 16*'h4c);//L
					 end
			else if ((DrawX >= gameover5_onX) && (DrawX < gameover5_onX + gameover5_onXsz) &&
					  (DrawY >= gameover5_onY) && (DrawY < gameover5_onY + gameover5_onYsz))
					 begin 
						gameover5_on = 1'b1;
						sprite_addr = (DrawY - gameover5_onY + 16*'h4f);//O
						if(win)
							sprite_addr = (DrawY - gameover1_onY + 16*'h44);//D
					 end
			else if ((DrawX >= gameover6_onX) && (DrawX < gameover6_onX + gameover6_onXsz) &&
					  (DrawY >= gameover6_onY) && (DrawY < gameover6_onY + gameover6_onYsz))
					 begin 
						gameover6_on = 1'b1;
						sprite_addr = (DrawY - gameover6_onY + 16*'h56);//V
						if(win)
							sprite_addr = (DrawY - gameover1_onY + 16*'h4f);//O
					 end
			else if ((DrawX >= gameover7_onX) && (DrawX < gameover7_onX + gameover7_onXsz) &&
					  (DrawY >= gameover7_onY) && (DrawY < gameover7_onY + gameover7_onYsz))
					 begin 
						gameover7_on = 1'b1;
						sprite_addr = (DrawY - gameover7_onY + 16*'h45);//E
						if(win)
							sprite_addr = (DrawY - gameover1_onY + 16*'h4e);//N
					 end
			else if ((DrawX >= gameover8_onX) && (DrawX < gameover8_onX + gameover8_onXsz) &&
					  (DrawY >= gameover8_onY) && (DrawY < gameover8_onY + gameover8_onYsz))
					 begin 
						gameover8_on = 1'b1;
						sprite_addr = (DrawY - gameover8_onY + 16*'h52);//R
						if(win)
							sprite_addr = (DrawY - gameover1_onY + 16*'h45);//E
					 end
			else if ((DrawX >= welcome1_onX) && (DrawX < welcome1_onX + welcome1_onXsz) &&
					  (DrawY >= welcome1_onY) && (DrawY < welcome1_onY + welcome1_onYsz))
					 begin 
						welcome1_on = 1'b1;
						sprite_addr = (DrawY - welcome1_onY + 16*'h50);//P
					 end
			else if ((DrawX >= welcome2_onX) && (DrawX < welcome2_onX + welcome2_onXsz) &&
					  (DrawY >= welcome2_onY) && (DrawY < welcome2_onY + welcome2_onYsz))
					 begin 
						welcome2_on = 1'b1;
						sprite_addr = (DrawY - welcome2_onY + 16*'h52);//R
					 end
			else if ((DrawX >= welcome3_onX) && (DrawX < welcome3_onX + welcome3_onXsz) &&
					  (DrawY >= welcome3_onY) && (DrawY < welcome3_onY + welcome3_onYsz))
					 begin 
						welcome3_on = 1'b1;
						sprite_addr = (DrawY - welcome3_onY + 16*'h45);//E
					 end
			else if ((DrawX >= welcome4_onX) && (DrawX < welcome4_onX + welcome4_onXsz) &&
					  (DrawY >= welcome4_onY) && (DrawY < welcome4_onY + welcome4_onYsz))
					 begin 
						welcome4_on = 1'b1;
						sprite_addr = (DrawY - welcome4_onY + 16*'h53);//S
					 end
			else if ((DrawX >= welcome5_onX) && (DrawX < welcome5_onX + welcome5_onXsz) &&
					  (DrawY >= welcome5_onY) && (DrawY < welcome5_onY + welcome5_onYsz))
					 begin 
						welcome5_on = 1'b1;
						sprite_addr = (DrawY - welcome5_onY + 16*'h53);//S
					 end
			else if ((DrawX >= welcome6_onX) && (DrawX < welcome6_onX + welcome6_onXsz) &&
					  (DrawY >= welcome6_onY) && (DrawY < welcome6_onY + welcome6_onYsz))
					 begin 
						welcome6_on = 1'b1;
						sprite_addr = (DrawY - welcome6_onY + 16*'h45);//E
					 end
			else if ((DrawX >= welcome7_onX) && (DrawX < welcome7_onX + welcome7_onXsz) &&
					  (DrawY >= welcome7_onY) && (DrawY < welcome7_onY + welcome7_onYsz))
					 begin 
						welcome7_on = 1'b1;
						sprite_addr = (DrawY - welcome7_onY + 16*'h4e);//N
					 end
			else if ((DrawX >= welcome8_onX) && (DrawX < welcome8_onX + welcome8_onXsz) &&
					  (DrawY >= welcome8_onY) && (DrawY < welcome8_onY + welcome8_onYsz))
					 begin 
						welcome8_on = 1'b1;
						sprite_addr = (DrawY - welcome8_onY + 16*'h54);//T
					 end
			else if ((DrawX >= welcome9_onX) && (DrawX < welcome9_onX + welcome9_onXsz) &&
					  (DrawY >= welcome9_onY) && (DrawY < welcome9_onY + welcome9_onYsz))
					 begin 
						welcome9_on = 1'b1;
						sprite_addr = (DrawY - welcome9_onY + 16*'h45);//E
					 end
			else if ((DrawX >= welcome10_onX) && (DrawX < welcome10_onX + welcome10_onXsz) &&
					  (DrawY >= welcome10_onY) && (DrawY < welcome10_onY + welcome10_onYsz))
					 begin 
						welcome10_on = 1'b1;
						sprite_addr = (DrawY - welcome10_onY + 16*'h52);//R
					 end
			else if ((DrawX >= welcome11_onX) && (DrawX < welcome11_onX + welcome11_onXsz) &&
					  (DrawY >= welcome11_onY) && (DrawY < welcome11_onY + welcome11_onYsz))
					 begin 
						welcome11_on = 1'b1;
						sprite_addr = (DrawY - welcome11_onY + 16*'h54);//T
					 end
			else if ((DrawX >= welcome12_onX) && (DrawX < welcome12_onX + welcome12_onXsz) &&
					  (DrawY >= welcome12_onY) && (DrawY < welcome12_onY + welcome12_onYsz))
					 begin 
						welcome12_on = 1'b1;
						sprite_addr = (DrawY - welcome12_onY + 16*'h4f);//O
					 end
			else if ((DrawX >= welcome13_onX) && (DrawX < welcome13_onX + welcome13_onXsz) &&
					  (DrawY >= welcome13_onY) && (DrawY < welcome13_onY + welcome13_onYsz))
					 begin 
						welcome13_on = 1'b1;
						sprite_addr = (DrawY - welcome13_onY + 16*'h53);//S
					 end
			else if ((DrawX >= welcome14_onX) && (DrawX < welcome14_onX + welcome14_onXsz) &&
					  (DrawY >= welcome14_onY) && (DrawY < welcome14_onY + welcome14_onYsz))
					 begin 
						welcome14_on = 1'b1;
						sprite_addr = (DrawY - welcome14_onY + 16*'h54);//T
					 end
			else if ((DrawX >= welcome15_onX) && (DrawX < welcome15_onX + welcome15_onXsz) &&
					  (DrawY >= welcome15_onY) && (DrawY < welcome15_onY + welcome15_onYsz))
					 begin 
						welcome15_on = 1'b1;
						sprite_addr = (DrawY - welcome15_onY + 16*'h41);//A
					 end
			else if ((DrawX >= welcome16_onX) && (DrawX < welcome16_onX + welcome16_onXsz) &&
					  (DrawY >= welcome16_onY) && (DrawY < welcome16_onY + welcome16_onYsz))
					 begin 
						welcome16_on = 1'b1;
						sprite_addr = (DrawY - welcome16_onY + 16*'h52);//R
					 end
			else if ((DrawX >= welcome17_onX) && (DrawX < welcome17_onX + welcome17_onXsz) &&
					  (DrawY >= welcome17_onY) && (DrawY < welcome17_onY + welcome17_onYsz))
					 begin 
						welcome17_on = 1'b1;
						sprite_addr = (DrawY - welcome17_onY + 16*'h54);//T
					 end		 
		  else if ( ( DistBX*DistBX + DistBY*DistBY) <= (VesselSize * VesselSize) ) 
            vessel_on = 1'b1;
        else 
			begin
            plan1_on = 1'b0;
				plan2_on = 1'b0;
				plan3_on = 1'b0;
				plan4_on = 1'b0;
				plan5_on = 1'b0;
				plan6_on = 1'b0;
				plan7_on = 1'b0;
				plan8_on = 1'b0;
				ast1_on = 1'b0;
				ast2_on = 1'b0;
				ast3_on = 1'b0;
				ast4_on = 1'b0;
				ast5_on = 1'b0;
				ast6_on = 1'b0;
				ast7_on = 1'b0;
				ast8_on = 1'b0;
				ast9_on = 1'b0;
				ast10_on = 1'b0;
				ast11_on = 1'b0;
				ast12_on = 1'b0;
				ast13_on = 1'b0;
				ast14_on = 1'b0;
				ast15_on = 1'b0;
				ast16_on = 1'b0;
				ast17_on = 1'b0;
				ast18_on = 1'b0;
				ast19_on = 1'b0;
				ast20_on = 1'b0;
				ast21_on = 1'b0;
				ast22_on = 1'b0;
				ast23_on = 1'b0;
				ast24_on = 1'b0;
				moon_on = 1'b0;
				vessel_on = 1'b0;
				gameover1_on = 1'b0;
				gameover2_on = 1'b0; 
				gameover3_on = 1'b0; 
				gameover4_on = 1'b0;
				gameover5_on = 1'b0;
				gameover6_on = 1'b0;
				gameover7_on = 1'b0;
				gameover8_on = 1'b0;
				welcome1_on = 1'b0;
				welcome2_on = 1'b0;
				welcome3_on = 1'b0;
				welcome4_on = 1'b0;
				welcome5_on = 1'b0;
				welcome6_on = 1'b0;
				welcome7_on = 1'b0;
				welcome8_on = 1'b0;
				welcome9_on = 1'b0;
				welcome10_on = 1'b0;
				welcome11_on = 1'b0;
				welcome12_on = 1'b0;
				welcome13_on = 1'b0;
				welcome14_on = 1'b0;
				welcome15_on = 1'b0;
				welcome16_on = 1'b0;
				welcome17_on = 1'b0;
				sprite_addr = 10'b0;
			end
    end
    
    // Assign color based on ball_on signal
    always_comb
    begin : RGB_Display
		  if(crash || win)
		  begin
				if((gameover1_on == 1'b1) && sprite_data[7 - DrawX + gameover1_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
				else if((gameover2_on == 1'b1) && sprite_data[7 - DrawX + gameover2_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
				else if((gameover3_on == 1'b1) && sprite_data[7 - DrawX + gameover3_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
				else if((gameover4_on == 1'b1) && sprite_data[7 - DrawX + gameover4_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
				else if((gameover5_on == 1'b1) && sprite_data[7 - DrawX + gameover5_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
				else if((gameover6_on == 1'b1) && sprite_data[7 - DrawX + gameover6_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
				else if((gameover7_on == 1'b1) && sprite_data[7 - DrawX + gameover7_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
				else if((gameover8_on == 1'b1) && sprite_data[7 - DrawX + gameover8_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
				else	
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'h00;
		  end
		  else if ((welcomepage == 1'b1))
		  begin
					if((welcome1_on == 1'b1) && sprite_data[7 - DrawX + welcome1_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome2_on == 1'b1) && sprite_data[7 - DrawX + welcome2_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome3_on == 1'b1) && sprite_data[7 - DrawX + welcome3_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome4_on == 1'b1) && sprite_data[7 - DrawX + welcome4_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome5_on == 1'b1) && sprite_data[7 - DrawX + welcome5_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome6_on == 1'b1) && sprite_data[7 - DrawX + welcome6_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome7_on == 1'b1) && sprite_data[7 - DrawX + welcome7_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome8_on == 1'b1) && sprite_data[7 - DrawX + welcome8_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome9_on == 1'b1) && sprite_data[7 - DrawX + welcome9_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome10_on == 1'b1) && sprite_data[7 - DrawX + welcome10_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome11_on == 1'b1) && sprite_data[7 - DrawX + welcome11_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome12_on == 1'b1) && sprite_data[7 - DrawX + welcome12_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome13_on == 1'b1) && sprite_data[7 - DrawX + welcome13_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome14_on == 1'b1) && sprite_data[7 - DrawX + welcome14_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome15_on == 1'b1) && sprite_data[7 - DrawX + welcome15_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome16_on == 1'b1) && sprite_data[7 - DrawX + welcome16_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else if((welcome17_on == 1'b1) && sprite_data[7 - DrawX + welcome17_onX] == 1'b1)
					begin
						Red = 8'hff;
						Green = 8'h00;
						Blue = 8'h00;
					end
					else
					begin
						Red = 8'h00;
						Green = 8'h00;
						Blue = 8'h00;
					end
		  
		  end
        else if ((vessel_on == 1'b1))
        begin
            // White ball
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end
		  else if ((plan1_on == 1'b1))
		  begin
				if((DrawY > Planet1Y +2) && (DrawY < Planet1Y +5))
				begin
					Red = 8'hff;
					Green = 8'h7f - {1'b0, DrawY[8:2]};
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h05 - {1'b0,DrawX[7:1]};
					Green = 8'h65 - {1'b0,DrawY[8:2]};
					Blue = 8'hf0 - {1'b0,DrawX[6:0]};
				end
		  end
		  else if ((plan2_on == 1'b1))
		  begin
				Red = 8'h7f - {1'b0,DrawX[6:0]};
            Green = 8'h7f - {1'b0,DrawX[6:0]};
            Blue = 8'h7f - {1'b0,DrawX[9:3]};
		  end
        else if ((plan3_on == 1'b1))
		  begin
				Red = 8'h00;
            Green = 8'h7f - {1'b0,DrawX[10:4]};
            Blue = 8'hff - {2'b0,DrawX[5:0]} - {2'b0,DrawY[5:0]};
		  end
		  else if ((plan4_on == 1'b1))
		  begin
				Red = 8'h00;
            Green = 8'h7f - {1'b0,DrawX[9:3]};
            Blue = 8'h2f;
		  end
		  else if ((plan5_on == 1'b1))
		  begin
				Red = 8'hff;
            Green = 8'h7f - {1'b0,DrawX[9:3]};
            Blue = 8'h6f - {1'b0,DrawY[6:0]};
		  end
		  else if ((plan6_on == 1'b1))
		  begin
				if(((DrawY > 	Planet6Y +5) && (DrawY < Planet6Y +10)) || (DrawY <Planet6Y -3) && (DrawY > Planet6Y - 6))
					begin
					Red = 8'hff;
					Green = 8'h0f - {1'b0,DrawX[9:3]};
					Blue = 8'h0f - {1'b0,DrawX[9:3]};
					end
				else
					begin
					Red = 8'hff;
					Green = 8'h88 - {1'b0,DrawX[6:0]};
					Blue = 8'h00;
					end
				
		  end
		  else if ((plan7_on == 1'b1))
		  begin
				Red = 8'hff - {1'b0,DrawX[6:0]} - {1'b0,DrawY[7:1]};
            Green = 8'h00;
            Blue = 8'h70 - {1'b0,DrawX[6:0]} - {2'b0,DrawY[8:3]};
		  end
		  else if ((plan8_on == 1'b1))
		  begin
				Red = 8'h7f - {2'b0,DrawX[5:0]} - {2'b0,DrawY[5:0]};
            Green = 8'h7f - {1'b0,DrawX[6:0]};
            Blue = 8'h7f - {2'b0,DrawX[5:0]} - {2'b0,DrawY[5:0]};
		  end
		  else if ((ast1_on == 1'b1) || 
		           (ast2_on == 1'b1) || 
					  (ast3_on == 1'b1) ||
					  (ast4_on == 1'b1) ||
					  (ast5_on == 1'b1) ||
					  (ast6_on == 1'b1) ||
					  (ast7_on == 1'b1) ||
					  (ast8_on == 1'b1) ||
					  (ast9_on == 1'b1) || 
		           (ast10_on == 1'b1) || 
					  (ast11_on == 1'b1) ||
					  (ast12_on == 1'b1) ||
					  (ast13_on == 1'b1) ||
					  (ast14_on == 1'b1) ||
					  (ast15_on == 1'b1) ||
					  (ast16_on == 1'b1) ||
					  (ast17_on == 1'b1) || 
		           (ast18_on == 1'b1) || 
					  (ast19_on == 1'b1) ||
					  (ast20_on == 1'b1) ||
					  (ast21_on == 1'b1) ||
					  (ast22_on == 1'b1) ||
					  (ast23_on == 1'b1) ||
					  (ast24_on == 1'b1))
		  begin
				Red = 8'h7f - {2'b0,DrawX[5:0]} - {2'b0,DrawY[5:0]};
            Green = 8'h7f - {2'b0,DrawX[5:0]} - {2'b0,DrawY[5:0]};
            Blue = 8'h7f - {2'b0,DrawX[5:0]} - {2'b0,DrawY[5:0]};
		  end
		  else if((moon_on == 1'b1))
			begin
				Red = 8'hf0; 
            Green = 8'hf0;
            Blue = 8'hf0;
			end
		  else 
        begin
            // Background with nice color gradient
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h05;
        end
    end 
    
endmodule

