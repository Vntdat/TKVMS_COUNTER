module counter (
	input clk,
	input rst_n,
	input sel,
	output reg [3:0] out
);
	reg [3:0] next_out;
	wire [3:0] temp;
	wire Cout;

	assign temp = (sel == 1'b1) ? 4'b0001 : 4'b1110;
	
	ripple_adder u_add (
		.X (out),
		.Y (temp),
		.S (next_out),
		.Co (Cout),
		.Cin (~sel)
	);

	always @(posedge clk, negedge rst_n) begin
		if (!rst_n) out <= 4'b0000;
		else out <= next_out;
	end
endmodule