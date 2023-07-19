module tb_Associative_Array_Methods();

// ASSOCIATIVE ARRAY

// Format: data_type  Array_Name  [index_type];

/*
int:           it is a 32-bit signed integer. 
               Range = -(2^(32-1)) to (2^(32-1) - 1)
               = -2,147,483,648 to 2,147,483,647

shortint:      it is a 16-bit signed integer.
longint:       it is a 64-bit signed integer.
*/
int array1 [int];
int array2 [string];
string array3 [int];
string array4 [string];
bit [3:0] array5 [string]; // if the key type is in string, the ordering will be alphabetical order
bit [3:0] array6 [string];
shortint s1,s2,s3,s4,s5,s6,a1,a2,a3,a4,a5,a6;
initial begin 
	array1 = '{1: 22, 2: 11111, 3: 3335, 5: 13};
	array2 = '{"A" : 1, "B" : 2};
	array3 = '{399940: "Malyka Awais", 399710: "Sana Fatima", 400000: "Arooj Khan"};
	array4 = '{"399940": "Malyka Awais", "399710": "Sana Fatima"};
	array5 = '{"IDLE": 0001, "DOOR_OPEN": 0010, "MOVING_UPWARDS" : 0100};

		$display("array1 = %p", array1);
		$display("array2 = %p", array2);
		$display("array3 = %p", array3);
		$display("array4 = %p", array4);
		$display("array5 = %p", array5);


// HOW to CALL Built in functions?

// We can simply call them in:
//                           1) COnditional statement
//                           2) Display
//                           3) or assign their return value to another variable
$display("-----METHODS--------");
$display("function int num ()");
// Returns the number of entries in the associative array

        s1 = array1.num();
		$display("size of array1 = %d", s1);
        s2 = array2.num();
		$display("size of array2 = %d", s2);
        s3 = array3.num();
		$display("size of array3 = %d", s3);
        s4 = array4.num();
		$display("size of array4 = %d", s4);
        s5 = array5.num();
		$display("size of array5 = %d", s5);
        s6 = array6.num();
		$display("size of array6 = %d", s6);
$display("function int size ()");
// Also returns the number of entries, if empty 0 is returned

        a1 = array1.size();
		$display("size of array1 = %d", a1);
        a2 = array2.size();
		$display("size of array2 = %d", a2);
        a3 = array3.size();
		$display("size of array3 = %d", a3);
        a4 = array4.size();
		$display("size of array4 = %d", a4);
        a5 = array5.size();
		$display("size of array5 = %d", a5);
        a6 = array6.size();
		$display("size of array6 = %d", a6);
$display("function void delete ( [input index] )");
// index when specified deletes the entry at that index, else the whole array is deleted
array3.delete(400000);
		$display("deleting entry 3 in array1 = %p", array3);
array5.delete();
		$display("deleting array5 = %p", array5);
$display("function int exists (input index)");
// Checks whether an element exists at specified index; returns 1 if it does, else 0 
if(array4.exists("399940"))
		$display("index 399940 exists: %p", array4["399940"]);
else
                $display("array4.exists(\"399940\"): %d", array4.exists("399940"));

		$display("function int exists (399710): %d", array4.exists("399710"));
$display("function int first (ref index)");
// Assigns to the given index variable the value of the first index; returns 0 for empty array 
/*if( array4.first("399940")) 
		$display("array4 becomes: %p", array4);
else
		$display("0");
$display("function int last (ref index)");
// Assigns to the given index variable the value of the first index; returns 0 for empty array 
if( array3.last(399710))
		$display("array3 becomes: %p", array3);
else
		$display("0");
$display("function int next (ref index)");
// Finds the smallest index whose value is greater than the given index
if(array1.next(3))
		$display("here: %d", array1.next(3));
else
		$display("here: %d", array1.next(3));
$display("function int prev (ref index)");
// Finds the largest index whose value is smaller than the given index
if(array1.prev(3))
		$display("here: %d", array1.prev(3));
else
		$display("here: %d", array1.prev(3));
*/	

end
endmodule
