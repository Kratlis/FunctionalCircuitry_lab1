`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2021 12:14:01 PM
// Design Name: 
// Module Name: gate-function
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gray_decoder(
    input g3,
    input g2,
    input g1,
    output x3,
    output x2,
    output x1
    );
    
    wire nx3, nx2, ng2, ng1, nx2ng1, nx2g1, nx3ng2, nx3g2;
    
    assign x3 = g3;
    
    nand(nx3, x3, x3);
    nand(nx2, x2, x2);
    nand(ng2, g2, g2);
    nand(ng1, g1, g1);
    
    nand(nx2ng1, x2, ng1);
    nand(nx2g1, nx2, g1);
    
    nand(nx3ng2, x3, ng2);
    nand(nx3g2, nx3, g2);
    
    nand(x2, nx3ng2, nx3g2);
    nand(x1, nx2ng1, nx2g1);
//    xor(x2, g2, x3);
//    xor(x1, g1, x2);
    
    wire d1, s;
    
//    or(s, a, b);
//    and(d, a, b);
//    nor(d1, d);
//    and(c, d1, s);
endmodule
