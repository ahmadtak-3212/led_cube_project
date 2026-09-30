`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2022 03:45:10 PM
// Design Name: 
// Module Name: top_level_tb
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


module top_level_tb;
    //Inputs
    logic clk_100mhz, btnc;
    logic [15:0] sw;
   // Outputs
   logic [7:0] ja;
   
   top_level uut(
        .clk_100mhz(clk_100mhz), .btnc(btnc), .sw(sw),
        .ja(ja)
    );
   always #5 clk_100mhz = !clk_100mhz;
   initial begin 
     clk_100mhz =0;
     btnc = 0;
     sw = 16'b0000_0000_0000_0000;
     #10000;
     btnc = 1;
     #200;
     btnc = 0;    
     #16_666_666;     
     sw = 16'b0000_0000_0000_0001;
   end
   
endmodule
