module maindec(input logic [5:0] op,
		input logic  pcbeq,pcbne,
		output logic pcsrc,
		output logic memtoreg, memwrite,
		output logic branch, alusrc,
		output logic regdst, regwrite,
		output logic jump,
		output logic [1:0] aluop,
		output logic braselect,
		output logic immselect);
		logic [10:0] controls;
	
	//adding all new control signals in controls 
	assign {regwrite, regdst, alusrc, branch, memwrite,
		memtoreg, jump, aluop,braselect,immselect} = controls;

	always_comb
	case(op)
	6'b000000: controls <= 11'b11000001000; // RTYPE
	6'b100011: controls <= 11'b10100100000; // LW
	6'b101011: controls <= 11'b00101000000; // SW
	6'b000100: controls <= 11'b00010000100; // BEQ
	
	//Modification for bne
	6'b000101: controls <= 11'b00010000110; // BNE

	6'b001000: controls <= 11'b10100000000; // ADDI
	6'b000010: controls <= 11'b00000010000; // J

	//Modification for ori
	6'b001101: controls <= 11'b10100001101; //ORI 


	default: controls <= 11'bxxxxxxxxxxx; // illegal op
	endcase

	//Modification for bne(assigning pcsrc control signal)
	mux2 #(1) pcsrcmux(pcbeq,pcbne,braselect,pcsrc);	

endmodule