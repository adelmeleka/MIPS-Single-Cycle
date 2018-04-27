module controller(input logic [5:0] op, funct,
		input logic zero,
		output logic memtoreg, memwrite,
		output logic pcsrc, alusrc,
		output logic regdst, regwrite,
		output logic jump,
		output logic [2:0] alucontrol,
		output logic immselect);
		logic [1:0] aluop;
		logic branch;
		
		//Modification for bne (hardware and new control signal)
		logic pcbeq;
		logic pcbne;
		logic braselect;

	//Hardware Modifications for bne
	assign pcbeq = branch & zero;
	assign pcbne = branch & ~zero;

	//sending the new control signals (for ori and bneq) to sub modules
	maindec md(op, pcbeq, pcbne, pcsrc, memtoreg, memwrite, branch,
		alusrc, regdst, regwrite, jump, aluop, braselect, immselect);

	aludec ad(funct, aluop, alucontrol);
	
	

endmodule