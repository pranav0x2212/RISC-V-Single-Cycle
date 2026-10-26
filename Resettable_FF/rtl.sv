module flopr #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d,
    input  logic             clk,
    input  logic             reset,
    output logic [WIDTH-1:0] q
);
    always_ff @(posedge clk, posedge reset)
        if (reset) q <= '0;
        else       q <= d;
endmodule
