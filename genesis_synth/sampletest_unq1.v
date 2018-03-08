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
//  Source file: /home/ketan94/ee271Project3/rtl/sampletest.vp
//  Source template: sampletest
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter PipelineDepth 	= 2
// Parameter Radix 	= 10
// Parameter Axis 	= 3
// Parameter Vertices 	= 3
// Parameter SigFig 	= 24
// Parameter Colors 	= 3
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
 *  Performs Sample Test on Micropolygon
 * 
 *  Inputs:
 *    Sample and MicroPolygon Information
 * 
 *  Outputs:
 *    Subsample Hit Flag, Subsample location, and Micropolygon Information
 * 
 *  Function:
 *    Utilizing Edge Equations determine whether the 
 *    sample location lies inside the micropolygon.
 *    In the simple case of the triangle, this will
 *    occur when the sample lies to one side of all
 *    three lines (either all left or all right).
 *    This corresponds to the minterm 000 and 111.
 *    Additionally, if backface culling is performed,
 *    then only keep the case of all right.
 * 
 *  Edge Equation:
 *    For an edge defined as travelling from the 
 *    vertice (x_1,y_1) to (x_2,y_2), the sample
 *    (x_s,y_s) lies to the right of the line
 *    if the following expression is true:
 * 
 *    0 >  ( x_2 - x_1 ) * ( y_s - y_1 ) - ( x_s - x_1 ) * ( y_2 - y_1 )
 *  
 *    otherwise it lies on the line (exactly 0) or 
 *    to the left of the line.
 *
 *    This block evaluates the six edges described by the
 *    micropolygons vertices,  to determine which
 *    side of the lines the sample point lies.  Then it
 *    determines if the sample point lies in the micropolygon
 *    by or'ing the appropriate minterms.  In the case of 
 *    the triangle only three edges are relevant.  In the
 *    case of the quadrilateral five edges are relevant.
 *  
 * 
 *   Author: John Brunhaver
 *   Created:      Thu 07/23/09
 *   Last Updated: Tue 10/06/10
 *
 *   Copyright 2009 <jbrunhaver@gmail.com>   
 *
 *
 */

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


/* A Note on Signal Names:
 *
 * Most signals have a suffix of the form _RxxxxN 
 * where R indicates that it is a Raster Block signal
 * xxxx indicates the clock slice that it belongs to
 * and N indicates the type of signal that it is.
 * H indicates logic high, L indicates logic low,
 * U indicates unsigned fixed point, and S indicates
 * signed fixed point.
 * 
 */



module  sampletest_unq1
  ( 
    input logic signed [24-1:0]  poly_R16S[3-1:0][3-1:0], // Micropolygon to Iterate Over
    input logic 			 unsigned [24-1:0] color_R16U[3-1:0] , // Color of Poly
    input logic signed [24-1:0]  sample_R16S[1:0], // Sample Location    
    input logic 			 validSamp_R16H, // A valid sample location
    input logic 			 isQuad_R16H, //Micropolygon is quad

    input logic 			 clk, // Clock
    input logic 			 rst, // Reset
  
    output logic signed [24-1:0] hit_R18S[3-1:0], // Hit Location
    output logic 			 unsigned [24-1:0] color_R18U[3-1:0] , // Color of Poly
    output logic 			 hit_valid_R18H                   // Is hit good
    );
   
   // output for retiming registers	
   logic signed [24-1:0] 	 hit_R18S_retime[3-1:0];   // Hit Location
   logic 				 unsigned [24-1:0]  color_R18U_retime[3-1:0];   // Color of Poly
   logic 				 hit_valid_R18H_retime;   // Is hit good
   // output for retiming registers	
   
   // Signals in Access Order  
   logic signed [24-1:0] 	 poly_shift_R16S[3-1:0][1:0]; // Micropolygon after coordinate shift 
   logic signed [24-1:0] 	 edge_R16S[3-1:0][1:0][1:0]; // Edges 
   logic signed [2*24-1:0] 	 dist_lg_R16S[3-1:0]; // Result of x_1 * y_2 - x_2 * y_1
   logic 				 hit_valid_R16H ; // Output (YOUR JOB!)
   logic signed [24-1:0] 	 hit_R16S[3-1:0]; // Sample position
   // Signals in Access Order 

   //////// DECLARE OTHER INTERMEDIATE SIGNALS YOU NEED


   //////// BEGIN YOUR IMPLEMENTATION

   // Your job is to produce the value for hit_valid_R16H signal, which indicates whether a sample lies inside the micropolygon.
   // hit_valid_R16H is high if validSamp_R16H && sample inside micropolygon (with back face culling)
   // Consider the following steps:

   //// (1) Shift X, Y coordinates such that the fragment resides on the (0,0) position.

   always_comb begin
      poly_shift_R16S[0][0] = poly_R16S[0][0] - sample_R16S[0];     
  
   end
   always_comb begin
      poly_shift_R16S[0][1] = poly_R16S[0][1] - sample_R16S[1];     
  
   end
   always_comb begin
      poly_shift_R16S[1][0] = poly_R16S[1][0] - sample_R16S[0];     
  
   end
   always_comb begin
      poly_shift_R16S[1][1] = poly_R16S[1][1] - sample_R16S[1];     
  
   end
   always_comb begin
      poly_shift_R16S[2][0] = poly_R16S[2][0] - sample_R16S[0];     
  
   end
   always_comb begin
      poly_shift_R16S[2][1] = poly_R16S[2][1] - sample_R16S[1];     
  
   end

   //// (2) Organize edges (form three edges for triangles)

   always_comb begin
     // assign edge_R16S

     
   end

   //// (3) Calculate distance x_1 * y_2 - x_2 * y_1

   always_comb begin
     // assign dist_lg_R16S
     dist_lg_R16S[0] = poly_shift_R16S[0][0]*poly_shift_R16S[1][1] - poly_shift_R16S[1][0]*poly_shift_R16S[0][1];
     dist_lg_R16S[1] = poly_shift_R16S[1][0]*poly_shift_R16S[2][1] - poly_shift_R16S[2][0]*poly_shift_R16S[1][1];
     dist_lg_R16S[2] = poly_shift_R16S[2][0]*poly_shift_R16S[0][1] - poly_shift_R16S[0][0]*poly_shift_R16S[2][1];

   end   

   //// (4) Check distance and assign hit_valid_R16H.

   always_comb begin
     // assign hit_valid_R16H
     //0 = (dist_lg_R16S[0] < 0.0) || (dist_lg_R16S[0]==0.0); 
     //0 = dist_lg_R16S[1] < 0.0; 
     //0 = dist_lg_R16S[2] <= 0.0; 

     //HIT_VALID_R16H = validSamp_R16H && 0 && 0 && 0;
    
   end   

   //////// END YOUR IMPLEMENTATION






   //Calculate Depth as depth of first vertex
   // Note that a barrycentric interpolation would
   // be more accurate
   always_comb begin
      hit_R16S[1:0] = sample_R16S[1:0]; //Make sure you use unjittered sample
      hit_R16S[2] = poly_R16S[0][2]; // z value equals the z value of the first vertex
   end
   //TODO: Calculate Depth by berrycentric intropolation


   /* Flop R16 to R18_retime with retiming registers*/
   
   dff2_unq5  d_samp_r1 (
				.in(hit_R16S) , 
				.clk(clk) , .reset(rst), .en(1'b1),
				.out(hit_R18S_retime));
   
   dff2_unq5  d_samp_r2(
			       .in(color_R16U) , 
			       .clk(clk) , .reset(rst), .en(1'b1),
			       .out(color_R18U_retime));
   
   dff_unq9  d_samp_r3 (
				.in(hit_valid_R16H) , 
				.clk(clk) , .reset(rst), .en(1'b1),
				.out(hit_valid_R18H_retime));
   
   /* Flop R16 to R18_retime with retiming registers*/
   
   
   /* Flop R18_retime to R18 with fixed registers */
   
   dff2_unq3  d_samp_f1 (
				.in(hit_R18S_retime) , 
				.clk(clk) , .reset(rst), .en(1'b1),
				.out(hit_R18S));
   
   dff2_unq3  d_samp_f2(
			       .in(color_R18U_retime) , 
			       .clk(clk) , .reset(rst), .en(1'b1),
			       .out(color_R18U));
   
   dff_unq6  d_samp_f3 (
				.in(hit_valid_R18H_retime) , 
				.clk(clk) , .reset(rst), .en(1'b1),
				.out(hit_valid_R18H));
   
   /* Flop R18_retime to R18 with fixed registers */ 

endmodule



