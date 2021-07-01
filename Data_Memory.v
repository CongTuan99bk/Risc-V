`timescale 1ns/1ps
`include "Parameter.v"
`include "riscv_defs.v"

// fpga4student.com 
// FPGA projects, VHDL projects, Verilog projects 
// Verilog code for RISC Processor 
// Verilog code for data Memory
module Data_Memory(
 input clk,
 // address input, shared by read and write port
 input [31:0]   mem_access_addr,
 
 // write port
 input [31:0]   mem_write_data,
 input mem_write_en,
 input mem_read,
 // read port
 output [31:0]   mem_read_data
);

reg [`col - 1:0] memory [`row_d - 1:0];
reg rs1 = 0;
/*reg [31:0] mem_access_addr = 32'b00000000010001010010011000000011;
reg mem_write_en = 1'b0;
reg mem_read = 1'b1;*/
integer f;
reg [4:0] ram_addr;
always @ *
begin
	ram_addr = 5'b0;
if ((mem_access_addr & `INST_LW_MASK) == `INST_LW)
begin
	ram_addr = rs1 + mem_access_addr[24:20]/4;
end
else if ((mem_access_addr & `INST_SW_MASK) == `INST_SW)
begin
	ram_addr = rs1 + mem_access_addr[11:7]/4;
end
end
initial
 begin
  $readmemb("D:/Nam_4/Kien_truc_may_tinh/BTL/riscv-master/core/riscv/test.data", memory);
 end
 integer i;
integer fb;
 always @(posedge clk ) begin
  if (mem_write_en)
  begin
   	memory[ram_addr] <= mem_write_data;
   	fb = $fopen("D:/Nam_4/Kien_truc_may_tinh/BTL/riscv-master/core/riscv/test.data", "w");
		for (i = 0; i < `row_d; i = i+1)
		begin
			if (i == ram_addr)
			$fwriteb(fb,mem_write_data,"\n");
		else
		  	$fwriteb(fb,memory[i],"\n");
		end
	 // Displays in binary
  `simulation_time;
  $fclose(fb);
  end
 end
 assign mem_read_data = (mem_read==1'b1) ? memory[ram_addr]: 32'd0; 

endmodule