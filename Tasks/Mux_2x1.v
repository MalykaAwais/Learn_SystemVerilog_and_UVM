module mux2X1( in0,in1,sel,out);
input in0,in1;
input sel;
output out;
assign out=(sel)?in1:in0; // if select is 1 1st input line is selected and viceversa
endmodule
