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

module UNG #(parameter width=5) (clk, rst, binary_data_in, un_data);

  input clk;
  input rst;
  input [width-1:0] binary_data_in;

  output reg un_data;


  reg [width-1:0] in;
  reg en;


  // ung logic
  always @(posedge clk) begin
    if (rst) begin
      in = binary_data_in;
    end else begin
      if (en) begin
        in = in - 1; 
      end     
    end
  end



assign en = (in[0] | in[1] | in[2] | in[3] | in[4]);// | in[5] | in[6] | in[7] 
assign un_data = en;

endmodule

