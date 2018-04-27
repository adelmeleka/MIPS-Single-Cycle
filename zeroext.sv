module zeroext (input [15:0] a,
		output [31:0] y);
	
	assign y = {{16{0}}, a};

endmodule