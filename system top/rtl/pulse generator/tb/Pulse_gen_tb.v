module Pulse_gen_tb ();

	////////////////////////////////// parameters declaration ///////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	parameter CLK_PERIOD = 100;

	///////////////////////////////////// signals declaration ///////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////

	reg 				 CLK_tb;
	reg 				 RST_tb;
	reg 				 LVL_SIG_tb;
	wire 				 PULSE_SIG_tb;

	//////////////////////////////////// clk generation block ///////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	initial begin
		CLK_tb = 1'b0;
		forever #(CLK_PERIOD/2) CLK_tb = ~CLK_tb;
	end

	////////////////////////////////////// DUT Instantiation ////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	Pulse_gen DUT (
		.CLK(CLK_tb), .RST(RST_tb),
		.LVL_SIG(LVL_SIG_tb), .PULSE_SIG(PULSE_SIG_tb)
	);

	//////////////////////////////////////// test stimilus //////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	
	initial begin
		LVL_SIG_tb = 1'b0;
		RST_TASK();
		LVL_SIG_tb = 1'b1;
		#500
		LVL_SIG_tb = 1'b0;
		#500
		LVL_SIG_tb = 1'b1;
		#1000
		$stop;

	end


	///////////////////////////////////// Tasks definations /////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	task RST_TASK;
		begin
			RST_tb = 1'b0;
			#(2*CLK_PERIOD)
			RST_tb = 1'b1;
		end
	endtask



endmodule