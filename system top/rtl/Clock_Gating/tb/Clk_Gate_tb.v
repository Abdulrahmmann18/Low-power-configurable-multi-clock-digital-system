module Clk_Gate_tb ();
	
	/////////////////////////////////////////// parameters //////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	parameter CLK_PERIOD  = 10;

	///////////////////////////////////// signals declaration ///////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	reg  CLK_tb;
	reg  CLK_EN_tb;
	wire GATED_CLK_tb;

	/////////////////////////////////// clk generation block ////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	initial begin
		CLK_tb = 0;
		forever #(CLK_PERIOD/2) CLK_tb = ~CLK_tb;
	end

	////////////////////////////////////// DUT Instantiation ////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	Clk_Gate DUT (
		.CLK(CLK_tb), .CLK_EN(CLK_EN_tb), .GATED_CLK(GATED_CLK_tb) 
	);

	//////////////////////////////////////// test stimilus //////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	initial begin
		CLK_EN_tb = 1'b1;
		#100
		CLK_EN_tb = 1'b0;
		#200
		CLK_EN_tb = 1'b1;
		#200
		$stop;
	end	



endmodule