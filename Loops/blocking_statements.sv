module blocking_statements();
reg [7:0] a, b, c, d, e;

initial begin
a = 8'hDA;
$display ("[%t] a=0x%0h b=0x%0h c=0x%0h d =0x%0h ",$time, a, b, c,d);
b = 8'hF1;
$display ("[%t] a=0x%0h b=0x%0h c=0x%0h d =0x%0h", $time, a, b, c,d);
c = 8'h3e;
$display ("[%t] a=0x%0h b=0x%0h c=0x%0h",$time, a, b, c);
end

initial begin

d = 8'haA;
$display ("[%t] d=0x%0h e=0x%0h", $time, d,e);
e = 8'hef;

$display ("[%t] d=0x%0h e=0x%0h", $time,d,e);
end
endmodule

