//////////////////////////////////////////////////////////////////////////////
//
//
// writen by Faeze Banitaba
//
//
// replace "width" with your desired number for DATA PRECISIONS
// AND
// modify OR function accordingly
//
// default parallelism degree is p=2 for simplicity,
// modification is needed for other degrees
//
//
//
/////////////////////////////////////////////////////////////////////////////

// width= 'm' in paper
// p= parallelism degree


module MUX2_1(D0, D1, S, Y);

output Y;
input D0, D1, S;

assign Y=(S)?D1:D0;

endmodule




module UNG_P #(parameter width=5, p=2) (clk, rst, binary_data_in, un_data);

  input clk;
  input rst;
  input [width-1:0] binary_data_in;

  output [p-1:0] un_data;


  reg [width-1:0] in;
  reg en;
  reg m_or;
  reg cs;
  reg sel;
  reg rem_1;
  reg rem_2;


  // ung logic
  always @(posedge clk) begin
    if (rst) begin
      in = binary_data_in;
      cs  = 0;
      sel = 0;
      rem_1 = 0;
      rem_2 = 0;
    end else begin
      if (en) begin
        in = in - p;
        if (in < p) begin     //comparator
          cs = 1;
        end 
      end else begin
        if (in > 5'b00000)
          rem_1 = 1;        
        if (in > 5'b00001)
          rem_2 = 1;
      end
    end
  end

  // controller
  always @(cs) begin
    if (cs) begin             // RemOut state
      en  = 0;
      sel = 1;
    end else begin          // Normal state
      en  = 1;
      sel = 0;
    end
  end


  // decoder




  assign m_or = (in[0] | in[1] | in[2] | in[3] | in[4]);// | in[5] | in[6] | in[7] 


  MUX2_1 mux0 (m_or, rem_1, sel, un_data[0]);
  MUX2_1 mux1 (m_or, rem_2, sel, un_data[1]);

endmodule





