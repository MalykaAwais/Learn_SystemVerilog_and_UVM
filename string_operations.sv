// Design a SystemVerilog module that receives a string as input 
//and checks if it is a valid email address 
//based on certain rules (e.g., contains "@" symbol and domain name).

module tb_string;
/*reg clk, rstn, data;
wire q;*/
int i = 0;
int j = 0;
int k = 0;
string s1;
string s2;
string s3;
string check1;

//d_ff d_ff1 ( .clk (clk), .rstn (rstn), .data (data), .q (q)); 
initial 
begin

s1 = "ali@gmail.com";
s2 = "malykaawais@gmail.com";
s3 = "malyka@";
check1 = "@gmail.com";
i = s1.len();
j = s2.len();
k = s3.len();
end

initial 
begin
if(s1.substr(i-10,i-1) == check1)
#10 $display("%s is a valid email address", s1);
if(s2.substr(j-10,j-1) == check1)
#10 $display("%s is a valid email address", s2);
if(s3.substr(k-10,k-1) == check1)
#10 $display("%s is a valid email address", s3);
end
endmodule

