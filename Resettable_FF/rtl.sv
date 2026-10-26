module flopr (input logic [7:0] d, input logic clk, reset, output logic [7:0] q);
  always_ff @(posedge clk, posedge reset) if (reset) q <= '0; else q <= d;
endmodule
