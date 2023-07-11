
module tb_F_to_C();
reg [7:0] temp_in_F;
wire [7:0] celsius;
reg clk, rstn;
            			F_to_C dut1(clk, rstn, temp_in_F, celsius);

initial 
  begin 
  $dumpfile("dump.vcd");
  $dumpvars(1);
    clk =1;
    rstn = 0; 
end 
always #10 clk = ~clk;
always  #100 rstn = 1; 


always
begin 
    
    #100 temp_in_F = 8'd159;  //70.555 in Celcius
    #80 temp_in_F = 8'd180;  //82
    #20 temp_in_F = 8'd100;   // 37
    #100 temp_in_F = 8'd200; //93.33*/
   #50 rstn =0;
    

end
endmodule 