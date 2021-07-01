`timescale 1ns / 1ps
// fpga4student.com 
// FPGA projects, VHDL projects, Verilog projects 
// Verilog code for RISC Processor 
// Verilog code for register file
module GPRs(
 input    clk,
 // write port
 input    reg_write_en,
 input  [4:0] reg_write_dest,
 input  [31:0] reg_write_data
 //read port 1  //doc phan tu th? 1
 /*input  [4:0] reg_read_addr_1,
 output  [31:0] reg_read_data_1,
 //read port 2 //doc phan tu th? 2
 input  [4:0] reg_read_addr_2,
 output  [31:0] reg_read_data_2*/
);
 reg [31:0] reg_array [31:0];
 integer i;
 integer fb;
 // write port
 //reg [2:0] i;
 initial begin
  /*for(i=0; i<31; i=i+1)
   reg_array[i] <= 32'd0;*/
	$readmemb("D:/Nam_4/Kien_truc_may_tinh/BTL/riscv-master/core/riscv/register.data", reg_array);
 end
 always @ (posedge clk ) begin
   if(reg_write_en) begin
    reg_array[reg_write_dest] <= reg_write_data;
	fb = $fopen("D:/Nam_4/Kien_truc_may_tinh/BTL/riscv-master/core/riscv/register.data", "w");
	for (i = 0; i <= 31; i = i+1)
	begin
		$fdisplay(fb,"%b",reg_array[i]);
	end
   end
 end
 

/* assign reg_read_data_1 = reg_array[reg_read_addr_1];
 assign reg_read_data_2 = reg_array[reg_read_addr_2*/
endmodule