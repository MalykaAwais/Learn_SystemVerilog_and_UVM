module tb_Dynamic_Array_with_each_index_of_assoc_arr();
typedef int DCE[];

// create an associative array where key is a specific data type (String)
// and value is a dynamic array
DCE f [string];

//PURPOSE:
// Purpose is to create an array/ chain of elements against a key value
initial begin
f["software"] = new[4];  
f["computer"] = new[4];
f["software"] = '{333221, 1212121, 390223, 111111};
f["computer"] = '{399940, 399710, 390223, 111111};

foreach(f[i])
	foreach(f[i][c])
		$display("PG[%s][%d]: %d",i, c, f[i][c]);
end
endmodule

