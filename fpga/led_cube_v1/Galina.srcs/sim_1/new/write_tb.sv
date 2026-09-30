`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2022 01:24:05 PM
// Design Name: 
// Module Name: write_tb
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


module write_tb;
    // Inputs
   logic clk, rst, start;
   logic [7:0] data_in;

   // Outputs
   logic data_out;
   logic data_clk;
   logic data_clr;
   logic sr_wr;
   logic led_en;
   logic done_out;

   // Instantiate the Unit Under Test (UUT)
   write uut (
      .clk(clk), .rst(rst),.start(start), .data_in(data_in), 
      .data_out(data_out), .data_clk(data_clk), .data_clr(data_clr), 
      .sr_wr(sr_wr), .done_out(done_out)
   );

   always #10 clk = !clk;
   
   initial begin
      // Initialize Inputs
      clk = 0;
      rst = 0;
      data_in = 8'b0000_0001;
      start = 0;
      // Wait 1000 ns for global reset to finish
      #1000;
      start = 1;
      #20;
      start = 0;
   end
endmodule
