//`timescale 1ns/10ps

module testbench;

  reg clk, rst_n;
  reg sel;
  reg [3:0] out;

  synth_wrapper counter (	.clk(clk),
	  			.rst_n(rst_n),
				.sel(sel),
				.out(out)
			);

  initial begin
    $shm_open("waves.shm"); 
    $shm_probe("AS");
  end
  //initial begin
  //   $sdf_annotate("synth_wrapper.sdf",full_adder);
  //end

  initial begin
        #0 clk=1;
     forever #5 clk=~clk;
  end

  initial begin
   	#0;
	rst_n = 0;
	sel = 1;
	#50;
	rst_n = 1;
	#205;
	sel = 0;
	#80;
	sel = 1;
	#50;
	$finish;
  end
endmodule

