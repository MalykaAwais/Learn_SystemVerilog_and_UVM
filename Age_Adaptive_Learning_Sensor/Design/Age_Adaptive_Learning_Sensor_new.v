module Age_Adaptive_Learning_Sensor_new (clk, rstn, age_group, correct_answer, operandd_a,operandd_b,operatorr);

//INPUTS
  input clk,rstn;
  input age_group;

//OUTPUTS
  output reg signed [7:0] correct_answer;
  output [3:0] operandd_a;	
  output [3:0] operandd_b;
  output [1:0] operatorr; // 1: addition, 2: subtraction, 3: multiplication
  
 
//	REGs
reg signed [7:0] temp;

//initial begin temp = 0; end

//ELEMENTS who are used at the outputs of module calling must be wires

LFSR_v4_new obj (clk, rstn, operandd_a, operandd_b, operatorr);

//assign operand_a = (if (age_group) ? value_if_true : value_if_false;

  always @(posedge clk) begin
    if (!rstn) begin
// WHEN RESET, assign these values
      correct_answer <= 0;
    end 
    else begin
		correct_answer <= temp;
  end
end

always@(age_group, operatorr, operandd_a, operandd_b)
begin
	case (age_group)
	0: 
	begin // Age group 5-8 years
	if((operandd_a[3] == 1 && (operandd_a[2:0] == 3'b001 || operandd_a[2:0] == 3'b000))&&(operandd_b[3] == 1 && (operandd_b[2:0] == 3'b001 || operandd_b[2:0] == 3'b000)))
	begin
		if(operatorr == 1)
		temp = operandd_a + operandd_b;
		else if (operatorr==2)
		temp = operandd_a - operandd_b; 
		else
		temp = operandd_a + operandd_b;
	end
	else if (operandd_a[3] == 1 && (operandd_a[2:0] == 3'b001 || operandd_a[2:0] == 3'b000))
	begin
		if(operatorr == 1)
		temp = operandd_a + operandd_b[2:0];
		else if (operatorr==2)
		temp = operandd_a - operandd_b[2:0]; 
		else
		temp = operandd_a + operandd_b[2:0];
    end
	else if (operandd_b[3] == 1 && (operandd_b[2:0] == 3'b001 || operandd_b[2:0] == 3'b000))
	begin
		if(operatorr == 1)
		temp = operandd_a[2:0] + operandd_b;
		else if (operatorr==2)
		temp = operandd_a[2:0] - operandd_b; 
		else
		temp = operandd_a[2:0] + operandd_b;
	end
	else
	begin
		if(operatorr == 1)
		temp = operandd_a[2:0] + operandd_b[2:0];
		else if (operatorr==2)
		temp = operandd_a[2:0] - operandd_b[2:0];  
		else
		temp = operandd_a[2:0] + operandd_b[2:0];
	end
	end
	1: begin // Age group 9-12 years
		if(operatorr == 1)
			temp = operandd_a + operandd_b;
		else if(operatorr == 2)
			temp = operandd_a - operandd_b;
		else
			temp = operandd_a * operandd_b;
	end
	default: temp = 0;
  endcase
end

endmodule