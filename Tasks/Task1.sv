module Task1();
  typedef struct {
    bit [7:0] in;
    bit [2:0] ctrl;
    bit [7:0] out;
  } barrel;

  barrel obj;

 /* task input_vectors(bit [7:0] in, bit [2:0] ctrl);
    #10;
    in = in + 64;
    ctrl = ctrl + 2; 
  endtask*/

task input_vectors;
inout bit [7:0] in;
inout bit [2:0] ctrl;

    #10;
    in = in + 64;
    ctrl = ctrl + 2; 
  endtask

  barrel_shifter_8bit uut(
    .in(obj.in),
    .ctrl(obj.ctrl),
    .out(obj.out)
  );
  
  initial begin
    $display($time, " << Starting the Simulation >>");
    obj.in = 8'd0;
    obj.ctrl = 3'd0; // no shift
    
    repeat(5) begin
      input_vectors(obj.in, obj.ctrl); // shift 4 bit
      $monitor("Input=%d, Control=%d, Output=%d", obj.in, obj.ctrl, obj.out);
    end
  end
endmodule

