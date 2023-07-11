typedef enum bit [1:0] {ADD_0, ADD_1, ADD_10, ADD_11} Test_Cases;
module tb_adder_using_enumerations();
reg a,b,cin;
wire sum ,cout;

Test_Cases t1;

adder uut1(a, b, cin, sum, cout); 

initial 
begin 
#100
a = 0;
b = 0;
cin = 0;
t1 = ADD_0;
#2
if((sum==0) && cout==0)
$display("%s passed at %0t", t1.name,$time);
else
$display("%s failed at %0t", t1.name,$time);

#100

a = 0;
b = 0;
cin = 1;
t1 = ADD_1;
#2
if((sum==1) && cout==0)
$display("%s passed at %0t", t1.name,$time);
else
$display("%s failed at %0t", t1.name,$time);

#100

a = 0;
b = 1;
cin = 1;
t1 = ADD_10;
#2
if((sum==0) && cout==1)
$display("%s passed at %0t", t1.name, $time);
else
$display("%s failed at %0t", t1.name, $time);
#100

a = 1;
b = 1;
cin = 1;
t1 = ADD_11;
#2
if((sum==1) && cout==1)
$display("%s passed at %0t", t1.name, $time);
else
$display("%s failed at %0t", t1.name, $time);

end


endmodule
