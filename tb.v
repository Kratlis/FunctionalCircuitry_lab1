module tb();

reg g2, g1, g0;
//reg a, b;
wire x2, x1, x0;
//wire c, d, e;

gate_function gf0(g2, g1, g0, x2, x1, x0);
    initial begin
        g2 = 0; g1 = 0; g0 = 0;
        #1 g2 = 0; g1 = 0; g0 = 1;
        #1 g2 = 0; g1 = 1; g0 = 1;
        #1 g2 = 0; g1 = 1; g0 = 0;
        #1 g2 = 1; g1 = 1; g0 = 0;
        #1 g2 = 1; g1 = 1; g0 = 1;
        #1 g2 = 1; g1 = 0; g0 = 1;
        #1 g2 = 1; g1 = 0; g0 = 0;
//        #1 a = 0; b = 1;
//        #1 a = 1; b = 0;
//        #1 a = 1; b = 1;
    end
endmodule