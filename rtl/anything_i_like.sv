module my_reg #(parameter W = 8)(output logic [W-1:0] dout, input logic rst, input logic ck, input logic [W-1:0] din);
  always_ff @(posedge ck, posedge rst) if (rst) dout <= '0; else dout <= din;
endmodule
