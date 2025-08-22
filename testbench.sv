// Ensure synchronization between design and testbench
`timescale 1ns / 1ps

module seven_segment_decoder_tb;
    // Inputs
    reg A, B, C;

    // Outputs
    wire a, b, c, d, e, f, g;

    // Instantiate the 7-segment decoder
    seven_segment_decoder uut (
        .A(A), .B(B), .C(C),
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g)
    );

    // Testbench logic
    initial begin
        $display("A B C | a b c d e f g");
        $monitor("%b %b %b | %b %b %b %b %b %b %b", A, B, C, a, b, c, d, e, f, g);

        // Apply all combinations of inputs: 000 - 111
        for (integer i = 0; i < 8; i = i + 1) begin
            {A, B, C} = i; // Binary representation of i
            #10;           // Wait 10 time units between each input
        end
        
        $finish;
    end
endmodule
