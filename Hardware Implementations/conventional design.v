//////////////////////////////////////////////////////////////////////////////
//
//
// writen by Faeze Banitaba
//
//
// replace width with your desired number for DATA PRECISIONS
// AND
// modify OR function accordingly
//
//
/////////////////////////////////////////////////////////////////////////////

// width= 'm' in paper

module UNG #(parameter width=4) (clk, rst, binary_data_in, un_data);

  input clk;
  input rst;
  input [width-1:0] binary_data_in;

  output reg un_data;

  reg [width-1:0] binary_data;
  reg [width-1:0] counter;
  reg [width-1:0] top = {width{1'b1}};



  // ung logic
  always @(posedge clk) begin
    if (rst) begin
      binary_data = binary_data_in;
      counter = 0;
    end else begin 
      un_data = (binary_data >= counter) ? 1'b1 : 1'b0 ;
      if (counter == top ) begin
        counter = 0;
      end
      else
        counter = counter + 1;
    end
  end


endmodule



