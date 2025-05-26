module synth_wrapper
(
	input clk,
	input rst_n,
	input sel,
	output reg [3:0] out
);
  reg [3:0] out_reg;
  wire  sel_reg = sel;


 always@(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
       out <= 4'b0;
    end
    else begin
       out <= out_reg;
    end
 end
 
 counter u1(
	.clk (clk),
	.rst_n (rst_n),
	.sel (sel_reg),
	.out (out_reg)
	);

endmodule
