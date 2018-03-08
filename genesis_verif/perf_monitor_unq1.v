//
//---------------------------------------------------------------------------
//  THIS FILE WAS AUTOMATICALLY GENERATED BY THE STANFORD GENESIS2 ENGINE
//  FOR MORE INFORMATION, CONTACT OFER SHACHAM FROM THE STANFORD VLSI GROUP
//  THIS VERSION OF GENESIS2 IS NOT TO BE USED FOR ANY COMMERCIAL USE
//---------------------------------------------------------------------------
//
//  
//	-----------------------------------------------
//	|            Genesis Release Info             |
//	|  $Change: 11012 $ --- $Date: 2012/09/13 $   |
//	-----------------------------------------------
//	
//
//  Source file: /home/ketan94/ee271Project3/verif/perf_monitor.vp
//  Source template: perf_monitor
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter Radix 	= 10
// Parameter PipelineDepth 	= 2
// Parameter Colors 	= 3
// Parameter SigFig 	= 24
// Parameter Vertices 	= 3
// Parameter Axis 	= 3
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Command Line input (priority=4):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From XML input (priority=3):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Config File input (priority=2):
//
// ---------------- End Pre-Generation Pramameters Status Report ----------------

/*
 * Performance monitor 
 * 
 * This module monitors the number of sample hits and the cycle counts
 * 
 * 
 *   Author: John Brunhaver, Ofer Shacham
 *   Created:          09/21/09
 *   Last Updated:     10/06/10
 *
 *   Copyright 2009 <jbrunhaver@gmail.com>  <shacham@stanford.edu> 
 */

 /****************************************************************************
 * Change bar:
 * -----------
 * Date           Author    Description
 * Sep 22, 2012   jingpu    ported from John's original code to Genesis
 *                          
 * ***************************************************************************/

/******************************************************************************
 * PARAMETERIZATION
 * ***************************************************************************/
// SigFig (_GENESIS2_INHERITANCE_PRIORITY_) = 24
//
// Radix (_GENESIS2_INHERITANCE_PRIORITY_) = 10
//
// Vertices (_GENESIS2_INHERITANCE_PRIORITY_) = 3
//
// Axis (_GENESIS2_INHERITANCE_PRIORITY_) = 3
//
// Colors (_GENESIS2_INHERITANCE_PRIORITY_) = 3
//
// PipelineDepth (_GENESIS2_INHERITANCE_PRIORITY_) = 2
//

module perf_monitor_unq1 
(
  input logic signed   [24-1:0]  poly_R16S[3-1:0][3-1:0],  // 4 Sets X,Y Fixed Point Values
  input logic unsigned [24-1:0]  color_R16U[3-1:0],          // 4 Sets X,Y Fixed Point Values
  input logic                        isQuad_R16H,                     // Is Poly Quad?
  input logic                        validSamp_R16H,
  input logic signed   [24-1:0]  sample_R16S[1:0],
			 
  input logic                        clk,                // Clock 
  input logic                        rst,                // Reset
			 
  input logic signed [24-1:0]   hit_R18S[3-1:0],
  input logic signed [24-1:0]   color_R18U[3-1:0],
  input                             hit_valid_R18H 
);

   //Pipe Signals for Later Evaluation
   logic signed   [24-1:0]  poly_RnnS[3-1:0][3-1:0];    // 4 Sets X,Y Fixed Point Values
   logic signed   [24-1:0]  poly_Rn1S[3-1:0][3-1:0];    // 4 Sets X,Y Fixed Point Values
   logic 		        isQuad_RnnH;                       // Is Poly Quad?
   logic 		        validSamp_RnnH;
   //Pipe Signals for Later Evaluation

 
	dff3_unq7  d_01 (
					 .in(poly_R16S) , 
				     .clk(clk) , .reset(rst), .en(1'b1),
				     .out(poly_RnnS));

	dff3_unq3  d_011 (
					 .in(poly_R16S) , 
				     .clk(clk) , .reset(rst), .en(1'b1),
				     .out(poly_Rn1S));
					 			 
					 						
	
	dff_unq13  d_04 (
					 .in({validSamp_R16H, isQuad_R16H}) , 
				     .clk(clk) , .reset(rst), .en(1'b1),
				     .out({validSamp_RnnH, isQuad_RnnH}));	        
					 
  

   int sample_count;
   int sample_hit_count;
   int micropolygon_count;
   int cycle_count;
   
   //Count the total Number of Valid Samples
   initial begin

      sample_count = 0;
      sample_hit_count = 0;
      micropolygon_count = 0;
      cycle_count = 0 ;

      @(negedge rst) ;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);

      while(1) begin
	 @(posedge clk);

	 sample_count = validSamp_RnnH ? (sample_count + 1) : sample_count;
	 
	 sample_hit_count = ( validSamp_RnnH && hit_valid_R18H ) ? 
			    ( sample_hit_count + 1 ) : sample_hit_count;
	 
	 micropolygon_count = ( poly_Rn1S != poly_RnnS ) ?
			      ( micropolygon_count + 1 ) : micropolygon_count;

	 cycle_count++ ;
	 
	 if (sample_count % 100000 == 0) begin
		$display("time=%10t \t%10d samples processed, %10d of them hit", $time, sample_count, sample_hit_count);
	 end
      end
   end
   //Count the total Number of Valid Samples

endmodule
