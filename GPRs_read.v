`timescale 1ns / 1ps
module GPRs_read(
 input    clk,
 // write port

 //read port 1  //doc phan tu th? 1
 input  [4:0] reg_read_addr_1,
 output  [31:0] reg_read_data_1,
 //read port 2 //doc phan tu th? 2
 input  [4:0] reg_read_addr_2,
 output  [31:0] reg_read_data_2
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

 assign reg_read_data_1 = reg_array[reg_read_addr_1];
 assign reg_read_data_2 = reg_array[reg_read_addr_2];

endmodule