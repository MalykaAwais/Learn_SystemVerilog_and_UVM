virtual class Packet;

bit [7:0] data;

function new();
   data = "A";
endfunction
endclass

class networkPackt extends Packet;

function new();
data = "B";

endfunction
endclass

module top_level_virtual_class();

networkPackt child;

initial begin 

child = new();
$display("child = %s", child.data);
end
endmodule

