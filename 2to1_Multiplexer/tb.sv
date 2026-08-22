`timescale 1ns/1ps

module mux2_tb;

    logic [7:0] d0, d1;
    logic       s;
    logic [7:0] y;

    mux2 dut (
        .d0(d0),
        .d1(d1),
        .s(s),
        .y(y)
    );

    initial begin
        d0 = 8'hAA;
        d1 = 8'h55;

        s = 1'b0;
        #1;
        assert(y === 8'hAA)
            else $fatal("FAIL: s=0, expected AA, got %h", y);

        s = 1'b1;
        #1;
        assert(y === 8'h55)
            else $fatal("FAIL: s=1, expected 55, got %h", y);

        $display("PASS: student mux2 testbench");
        $finish;
    end

endmodule
