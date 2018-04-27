module imem(input logic [5:0] a,
	output logic [31:0] rd);

	reg [31:0] RAM[63:0];	
	initial	
		begin
			$readmemh("C:/Users/adelm/Desktop/SingleCycleModified/memfile2.dat",RAM);
		end

	assign rd = RAM[a]; // word aligned

endmodule