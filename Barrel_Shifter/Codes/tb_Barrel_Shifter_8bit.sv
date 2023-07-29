module barrel_shifter_8bit_tb();
  typedef struct {
    bit [7:0] in;
    bit [2:0] ctrl;
    bit [7:0] out;
  } barrel;

  barrel obj;

  function automatic void input_vectors(ref bit [7:0] in, ref bit [2:0] ctrl);
    in = in + 64;
    ctrl = ctrl + 2; 
  endfunction
  
  barrel_shifter_8bit uut(
    .in(obj.in),
    .ctrl(obj.ctrl),
    .out(obj.out)
  );
  
  initial begin
    $display($time, " << Starting the Simulation >>");
    obj.in = 8'd0;
    obj.ctrl = 3'd0; // no shift
    
    #10 input_vectors(obj.in, obj.ctrl); // shift 4 bit
    #10 input_vectors(obj.in, obj.ctrl); // shift 2 bit
    #10 input_vectors(obj.in, obj.ctrl); // shift by 1 bit
    #10 input_vectors(obj.in, obj.ctrl); // shift by 7 bits
  end

  initial begin
    $monitor("Input=%d, Control=%d, Output=%d", obj.in, obj.ctrl, obj.out);
  end
endmodule

