`timescale 1ns/1ps

module if_stage (
    input  logic        clk,
    input  logic        reset,              // Asynchronous active-high reset

    // Control inputs
    input  logic        stall,
    input  logic        and_out,

    // Target address for branch/jump
    input  logic [31:0] pc_signed_offset,

    // Outputs
    output logic [31:0] address,
    output logic [31:0] pc_new
);

    // ============================================================
    // PC + 4
    // ============================================================
    assign pc_new = address + 32'd4;


    // ============================================================
    // Next PC
    //
    // 1. Branch/Jump
    // 2. PC + 4
    // ============================================================
    logic [31:0] pc_next;

    always_comb begin
        if (and_out)
            pc_next = pc_signed_offset;
        else
            pc_next = pc_new;
    end


    // ============================================================
    // PC Register
    // ============================================================
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            address <= 32'h8000_0000;
        else if (!stall)
            address <= pc_next;
    end

endmodule