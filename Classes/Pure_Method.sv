virtual class BaseClass;
int data;

pure virtual function int getData(); //Prototype of function defined in the virtual base class

// use pure keyword

endclass

class ChildClass extends BaseClass;
virtual function int getData();     // rest of the functionality in childclass
data = 32'hcafe_cafe;
return data;
endfunction
endclass

module tb;
ChildClass child;
initial begin
child = new();
$display ("data = %h", child.getData());
end
endmodule

