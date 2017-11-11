//-------------------------------------------------------------------------
//      SAT.sv                                                      --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Fall 2014 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 7                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module SAT( input               CLOCK_50,
             input        [3:0]  KEY,          //bit 0 is set up as Reset
             output logic [6:0]  HEX0, HEX1,
             // VGA Interface 
             output logic [7:0]  VGA_R,        //VGA Red
                                 VGA_G,        //VGA Green
                                 VGA_B,        //VGA Blue
             output logic        VGA_CLK,      //VGA Clock
                                 VGA_SYNC_N,   //VGA Sync signal
                                 VGA_BLANK_N,  //VGA Blank signal
                                 VGA_VS,       //VGA vertical sync signal
                                 VGA_HS,       //VGA horizontal sync signal
             // CY7C67200 Interface
             inout  wire  [15:0] OTG_DATA,     //CY7C67200 Data bus 16 Bits
             output logic [1:0]  OTG_ADDR,     //CY7C67200 Address 2 Bits
             output logic        OTG_CS_N,     //CY7C67200 Chip Select
                                 OTG_RD_N,     //CY7C67200 Write
                                 OTG_WR_N,     //CY7C67200 Read
                                 OTG_RST_N,    //CY7C67200 Reset
             input               OTG_INT,      //CY7C67200 Interrupt
             // SDRAM Interface for Nios II Software
             output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
             inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
             output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
             output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
             output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
                                 DRAM_CAS_N,   //SDRAM Column Address Strobe
                                 DRAM_CKE,     //SDRAM Clock Enable
                                 DRAM_WE_N,    //SDRAM Write Enable
                                 DRAM_CS_N,    //SDRAM Chip Select
                                 DRAM_CLK      //SDRAM Clock
                    );
    
    logic Reset_h, Clk, gamereset;
    logic [15:0] keycode;
	 logic [1:0] state;
	 logic [2:0] curplan;
    integer VesselX, VesselY, VesselS; 
	 integer DrawX, DrawY;
	 logic crash, welcomepage, win;
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
	 integer Ast1X = 240;
	 integer Ast1Y = 245;
	 integer Ast1S = 4;
	 integer Ast2X = 360;
	 integer Ast2Y = 380;
	 integer Ast2S = 4;
	 integer Ast3X = 272;
	 integer Ast3Y = 270;
	 integer Ast3S = 4;
	 integer Ast4X = 289;
	 integer Ast4Y = 350;
	 integer Ast4S = 4;
	 integer Ast5X = 281;
	 integer Ast5Y = 315;
	 integer Ast5S = 4;
	 integer Ast6X = 310;
	 integer Ast6Y = 305;
	 integer Ast6S = 4;
	 integer Ast7X = 320;
	 integer Ast7Y = 282;
	 integer Ast7S = 4;
	 integer Ast8X = 345;
	 integer Ast8Y = 400;
	 integer Ast8S = 4;
	 integer Ast9X = 312;
	 integer Ast9Y = 217;
	 integer Ast9S = 4;
	 integer Ast10X = 342;
	 integer Ast10Y = 180;
	 integer Ast10S = 4;
	 integer Ast11X = 278;
	 integer Ast11Y = 90;
	 integer Ast11S = 4;
	 integer Ast12X = 305;
	 integer Ast12Y = 160;
	 integer Ast12S = 4;
	 integer Ast13X = 368;
	 integer Ast13Y = 212;
	 integer Ast13S = 4;
	 integer Ast14X = 265;
	 integer Ast14Y = 12;
	 integer Ast14S = 4;
	 integer Ast15X = 318;
	 integer Ast15Y = 16;
	 integer Ast15S = 4;
	 integer Ast16X = 180;
	 integer Ast16Y = 10;
	 integer Ast16S = 4;
	 integer Ast17X = 355;
	 integer Ast17Y = 110;
	 integer Ast17S = 4;
	 integer Ast18X = 402;
	 integer Ast18Y = 101;
	 integer Ast18S = 4;
	 integer Ast19X = 450;
	 integer Ast19Y = 122;
	 integer Ast19S = 4;
	 integer Ast20X = 410;
	 integer Ast20Y = 146;
	 integer Ast20S = 4;
	 integer Ast21X = 395;
	 integer Ast21Y = 240;
	 integer Ast21S = 4;
	 integer Ast22X = 272;
	 integer Ast22Y = 108;
	 integer Ast22S = 4;
	 integer Ast23X = 230;
	 integer Ast23Y = 200;
	 integer Ast23S = 4;
	 integer Ast24X = 240;
	 integer Ast24Y = 430;
	 integer Ast24S = 4;
	 integer moonx;
	 integer moony;
	 integer sinmoon, cosmoon;
	 integer moons;
    integer VesselXAccel_in, VesselYAccel_in;
	 integer thetaout, sin, cos, theta, moontheta;
	 assign Clk = CLOCK_50;
    assign {Reset_h} = ~(KEY[0]);  // The push buttons are active low
    assign {gamereset} = ~(KEY[1]); //reset for vga and ball
    logic [1:0] hpi_addr;
    logic [15:0] hpi_data_in, hpi_data_out;
    logic hpi_r, hpi_w,hpi_cs;
    integer thetaoutmoon;
    // Interface between NIOS II and EZ-OTG chip
    hpi_io_intf hpi_io_inst(
                            .Clk(Clk),
                            .Reset(Reset_h),
                            // signals connected to NIOS II
                            .from_sw_address(hpi_addr),
                            .from_sw_data_in(hpi_data_in),
                            .from_sw_data_out(hpi_data_out),
                            .from_sw_r(hpi_r),
                            .from_sw_w(hpi_w),
                            .from_sw_cs(hpi_cs),
                            // signals connected to EZ-OTG chip
                            .OTG_DATA(OTG_DATA),    
                            .OTG_ADDR(OTG_ADDR),    
                            .OTG_RD_N(OTG_RD_N),    
                            .OTG_WR_N(OTG_WR_N),    
                            .OTG_CS_N(OTG_CS_N),    
                            .OTG_RST_N(OTG_RST_N)
    );
     
     //The connections for nios_system might be named different depending on how you set up Qsys
     SAT_soc nios_system(
                             .clk_clk(Clk),         
                             .reset_reset_n(KEY[0]),   
                             .sdram_wire_addr(DRAM_ADDR), 
                             .sdram_wire_ba(DRAM_BA),   
                             .sdram_wire_cas_n(DRAM_CAS_N),
                             .sdram_wire_cke(DRAM_CKE),  
                             .sdram_wire_cs_n(DRAM_CS_N), 
                             .sdram_wire_dq(DRAM_DQ),   
                             .sdram_wire_dqm(DRAM_DQM),  
                             .sdram_wire_ras_n(DRAM_RAS_N),
                             .sdram_wire_we_n(DRAM_WE_N), 
                             .sdram_clk_clk(DRAM_CLK),
                             .keycode_export(keycode),  
                             .otg_hpi_address_export(hpi_addr),
                             .otg_hpi_data_in_port(hpi_data_in),
                             .otg_hpi_data_out_port(hpi_data_out),
                             .otg_hpi_cs_export(hpi_cs),
                             .otg_hpi_r_export(hpi_r),
                             .otg_hpi_w_export(hpi_w)
    );
    
    //Fill in the connections for the rest of the modules 
    VGA_controller vga_controller_instance(.Reset(gamereset), .*);
   
    vessel ball_instance(.Reset(gamereset), .frame_clk(VGA_VS),.*);
    
	 sincos mayo(.*);
	 
	 sincos formoon(.thetaout(thetaoutmoon), .sin(sinmoon), .cos(cosmoon),.*);
	 
	 orbitmachine ted(.Reset(gamereset),.frame_clk(VGA_VS),.*);
	 	 
    color_mapper color_instance(.*);
    
    HexDriver hex_inst_0 (keycode[3:0], HEX0);
    HexDriver hex_inst_1 (keycode[7:4], HEX1);
    
    /**************************************************************************************
        ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
        Hidden Question #1/2:
        What are the advantages and/or disadvantages of using a USB interface over PS/2 interface to
             connect to the keyboard? List any two.  Give an answer in your Post-Lab.
    **************************************************************************************/
endmodule
