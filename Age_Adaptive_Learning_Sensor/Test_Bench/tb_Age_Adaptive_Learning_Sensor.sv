//the purpose of this problem is to understand the use of dynamic arrays
// and learn the array manipulation

module tb_Age_Adaptive_Learning_Sensor();
bit clk, rstn;
bit age_group;
byte correct_answer; // byte (8 bits) is a signed variable bydefault

// I also experimented for signed values using shortint (16 bits) which worked well

bit [3:0] operand_a; 
bit [3:0] operand_b;
bit [1:0] operator;

 
int res [$];   // dynamic array
int age[8] = {5,7,8,8,10,11,11,12}; // 1D unpacked array

Age_Adaptive_Learning_Sensor_new uut (clk, rstn, age_group, correct_answer, operand_a,operand_b,operator);

typedef enum {Test_Vector[1:8]=1} Test_Cases;
Test_Cases t = Test_Vector1;

initial begin rstn = 0; clk = 1; #19; rstn = 1; end

//initial begin #21 rstn = 0; clk = 1; #19; rstn = 1; end

always #10 clk = ~ clk;

initial begin

 // 5 - 8 yrs
res = age.find(x) with (x>4 && x<9);
for(int i = 0; i<res.size(); i++)
begin
#20;
age_group = 0;
$display("correct ans: %d", correct_answer);
if (t == Test_Vector1)
        t = t.next();
      else
        t = t.next();
end
res = age.find(x) with (x>8 && x<13);
for(int i = 0; i<res.size(); i++)
begin
#20;
age_group = 1;
if (t == Test_Vector1)
        t = t.next();
      else
        t = t.next();
end
end
endmodule


