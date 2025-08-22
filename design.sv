// Ensure synchronization between design and testbench
`timescale 1ns / 1ps

// Segment modules
module segment_a(input A, B, C, output a);
  assign a = B | (A & C) | (~A & ~C);
endmodule

module segment_b(input A, B, C, output b);
    assign b = ~A | (B & C) | (~B & ~C);
endmodule

module segment_c(input A, B, C, output c);
    assign c = A | C | ~B;
endmodule

module segment_d(input A, B, C, output d);
    assign d = (~A & (B | ~C)) | (B & ~C) | (A & ~B & C);
endmodule

module segment_e(input A, B, C, output e);
    assign e = ~C & (B | ~A);
endmodule

module segment_f(input A, B, C, output f);
    assign f = (~C & (A | ~B)) | (A & ~B);
endmodule

module segment_g(input A, B, C, output g);
    assign g = (A & ~C) | (A ^ B);
endmodule

// Top-level 7-segment decoder module
module seven_segment_decoder(input A, B, C, output a, b, c, d, e, f, g);
    segment_a seg_a(.A(A), .B(B), .C(C), .a(a));
    segment_b seg_b(.A(A), .B(B), .C(C), .b(b));
    segment_c seg_c(.A(A), .B(B), .C(C), .c(c));
    segment_d seg_d(.A(A), .B(B), .C(C), .d(d));
    segment_e seg_e(.A(A), .B(B), .C(C), .e(e));
    segment_f seg_f(.A(A), .B(B), .C(C), .f(f));
    segment_g seg_g(.A(A), .B(B), .C(C), .g(g));
endmodule
