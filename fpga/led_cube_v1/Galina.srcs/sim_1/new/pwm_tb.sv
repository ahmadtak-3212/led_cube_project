`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2022 02:03:20 PM
// Design Name: 
// Module Name: pwm_tb
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


module pwm_tb;
   //inputs
   logic clk, rst, start;
   logic [23:0] pixel;

   // Outputs
   logic pwm_red_out, pwm_green_out, pwm_blue_out;
   logic done_out;
    
   pwm uut (
            .clk(clk), .rst(rst), .start(start),
            .pixel(pixel), 
            .pwm_red_out(pwm_red_out), .pwm_green_out(pwm_green_out), .pwm_blue_out(pwm_blue_out),
            .done_out(done_out)
            );
   always #10 clk = !clk;
   initial begin
      clk = 0;
      rst = 0;
      start = 0;
      pixel = {8'd255, 8'd255, 8'd255};
      #1000;
      start = 1;
      #200;
      start = 0;
   end 
endmodule
