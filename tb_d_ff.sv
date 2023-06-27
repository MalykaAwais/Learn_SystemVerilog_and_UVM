// Code your testbench here
// or browse Examples
// File : tb_top.sv 
module tb_d_ff (); 
  reg clk; 
  reg rstn; 
  reg data; 
  wire q; 
// Instantiate the design 
  
  d_ff d_ff0 ( .clk (clk), .rstn (rstn), .data (data), .q (q)); 
// Create a clock 
  

initial 
  begin 
  //$dumpfile("dump.vcd");
  //$dumpvars(1);
    clk =1;
    rstn = 0; 
    data = 0;
end 
always #10 clk = ~clk;
  always
begin 
     
    #100 rstn = 1; 
    #50 data = 1; 
    #80 data = 0; 
    #20 data = 1; 
    #100 data = 0; 
    end 
endmodule 
