module tb_Associative_Arrays();

// ASSOCIATIVE ARRAY

// Format: data_type Arra_Name [index_type];

/*
int:           it is a 32-bit signed integer. 
               Range = -(2^(32-1)) to (2^(32-1) - 1)
               = -2,147,483,648 to 2,147,483,647

shortint:      it is a 16-bit signed integer.
longint:       it is a 64-bit signed integer.
*/
int array1 [int];
int array2 [string];
string array3 [shortint];
string array4 [string];
bit [3:0] array5 [string]; // if the key type is in string, the ordering will be alphabetical order

initial begin 
	array1 = '{1: 22, 2: 3335};
	array2 = '{"A" : 1, "B" : 2};
	array3 = '{399940: "Malyka Awais", 399710: "Sana Fatima"};
	array4 = '{"399940": "Malyka Awais", "399710": "Sana Fatima"};
	array5 = '{"IDLE": 0001, "DOOR_OPEN": 0010, "MOVING_UPWARDS" : 0100};

		$display("array1 = %p", array1);
		$display("array2 = %p", array2);
		$display("array3 = %p", array3);
		$display("array4 = %p", array4);
		$display("array5 = %p", array5);
end
endmodule