`timescale 1ns/1ps
module riscv_GPRs_write_exe(
 input    clk,
 // write port
 input    reg_write_en,
 input  [4:0] reg_write_dest,
 input  [31:0] reg_write_data
);
 reg [31:0] reg_array [31:0];
 reg [31:0] reg_data_w;
 integer i;
 integer fw;
 initial begin
	$readmemb("D:/Nam_4/Kien_truc_may_tinh/BTL/riscv-master/core/riscv/register.data", reg_array);
 end
 always @ *
  reg_data_w = reg_write_data;
 always @ (posedge clk) begin
   if(reg_write_en) begin
    reg_array[reg_write_dest] <= reg_write_data;
	fw = $fopen("D:/Nam_4/Kien_truc_may_tinh/BTL/riscv-master/core/riscv/register.data", "w");
	for (i = 0; i <= 31; i = i+1)
	begin
		if (i == reg_write_dest)
			$fwriteb(fw,reg_write_data,"\n");
		else
		  	$fwriteb(fw,reg_array[i],"\n");
		end
  	$fclose(fw);
   	end
 end
 

/* assign reg_read_data_1 = reg_array[reg_read_addr_1];
 assign reg_read_data_2 = reg_array[reg_read_addr_2*/
endmodule
