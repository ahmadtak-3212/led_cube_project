`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2022 03:01:50 PM
// Design Name: 
// Module Name: led_driver_fsm_tb
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


module led_driver_fsm_tb;

    // Inputs
   logic clk, rst, start;
   logic [3:0][15:0][23:0] led_cube;

   // Outputs
   logic data_out;
   logic data_clk;
   logic data_clr;
   logic sr_wr;
   logic pwm_red_out, pwm_green_out, pwm_blue_out;
   logic [1:0] z_level;

   // Instantiate the Unit Under Test (UUT)
   led_driver_fsm uut (
      .clk(clk), .rst(rst),.start(start), .led_cube(led_cube), 
      .data_out(data_out), .data_clk(data_clk), .data_clr(data_clr), 
      .sr_wr(sr_wr), 
      .pwm_red_out(pwm_red_out),  .pwm_green_out(pwm_green_out),  .pwm_blue_out(pwm_blue_out),
      .z_level(z_level)
   );

   always #100 clk = !clk;
   
   initial begin
      // Initialize Inputs
      clk = 0;
      rst = 0;
      led_cube = { 
                   {
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}
                   }, 
                   {
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}
                   }, 
                   {
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}
                   },
                   {
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255},
                    {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}, {8'd255, 8'd255, 8'd255}
                   }
                 };
      start = 0;
      // Wait 1000 ns for global reset to finish
      #1000;
      start = 1;
      #200;
      start = 0;
   end

endmodule
