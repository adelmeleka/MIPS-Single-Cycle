module mips(input logic clk, reset,
	output logic [31:0] pc,
	input logic [31:0] instr,
	output logic memwrite,
	output logic [31:0] aluout, writedata,
	input logic [31:0] readdata);

	logic memtoreg, alusrc, regdst,
	//adding new control signal for ori
	regwrite, jump, pcsrc, zero, immselect;
	logic [2:0] alucontrol;

	//Sending the new control signal into the main 2 modules 
	controller c(instr[31:26], instr[5:0], zero,
			memtoreg, memwrite, pcsrc,
			alusrc, regdst, regwrite, jump,
			alucontrol,immselect);

	datapath dp(clk, reset, memtoreg, pcsrc,
			alusrc, regdst, regwrite, jump,
			alucontrol, 
			zero, pc, instr,
			aluout, writedata, readdata, immselect);

endmodule