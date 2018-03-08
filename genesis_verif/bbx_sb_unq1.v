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
//  Source file: /home/aroushan/ee271/ee271ProjP3/verif/bbx_sb.vp
//  Source template: bbx_sb
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter SigFig 	= 24
// Parameter Colors 	= 3
// Parameter Radix 	= 10
// Parameter PipelineDepth 	= 3
// Parameter Filename 	= sb_log/bbx_sb.log
// Parameter Axis 	= 3
// Parameter Vertices 	= 3
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
 * bbx_sb
 * 
 * The bounding box score board: 
 *   This scoreboard checks that the output 
 *   of the bounding box moudle is correct.
 *   It does this by checking the function against
 *   the golden model, which is imported using DPI.
 * 
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
// PipelineDepth (_GENESIS2_INHERITANCE_PRIORITY_) = 3
//
// Filename (_GENESIS2_INHERITANCE_PRIORITY_) = sb_log/bbx_sb.log
//

import "DPI" pure function int rastBBox_bbox_check( 
						    int v0_x, //uPoly
			    			    int v0_y, //uPoly
						    int v1_x, //uPoly
						    int v1_y, //uPoly
						    int v2_x, //uPoly
						    int v2_y, //uPoly
						    int v3_x, //uPoly
						    int v3_y, //uPoly
						    int q, //uPoly
						    int valid_Poly,
						    int ll_x, //BBOX
						    int ll_y, //BBOX
						    int ur_x, //BBOX
						    int ur_y, //BBOX
						    int ss_w_lg2, //Subsample
						    int screen_w, //Screen
						    int screen_h, //Screen
						    int valid , //BBoX
						    int r_shift, //Config
						    int r_val     //Congig 
						    );


	 

module bbx_sb_unq1 
(
 
  input logic signed [24-1:0] poly_R10S[3-1:0][3-1:0],
  input logic 			      validPoly_R10H , // Valid Data for Operation   
  input logic 			      isQuad_R10H , // Is Poly Quad?

  input logic signed [24-1:0] box_R13S[1:0][1:0] , // 2 Sets X,Y Fixed Point Values   
  input logic signed [24-1:0] poly_R13S[3-1:0][3-1:0] , // 4 Sets X,Y Fixed Point Values
  input logic 			      validPoly_R13H , // Valid Data for Operation
  input logic 			      isQuad_R13H , // Is Poly Quad?
  input logic 			      clk , // Clock 
  input logic 			      rst , // Reset
 
  input logic 			      halt_RnnnnL , // Halt Signal   
  input logic signed [24-1:0] screen_RnnnnS[1:0] , // Screen Dimensions
  input logic [3:0] 		      subSample_RnnnnU                  // SubSample_Interval
 
);

   logic signed [24-1:0]   poly_RnnS[3-1:0][3-1:0];
   logic                       validPoly_RnnH ;                  // Valid Data for Operation   
   logic                       isQuad_RnnH ;                     // Is Poly Quad?
   logic [1:0][1:0] 	       invalidate_RnnH;
   

   
   int 		       ss_w_lg2;
   int 		       one;
   int 		       file;
   assign one = 1 ;
      
   initial begin
      file = $fopen("sb_log/bbx_sb.log","w");
   end

   always_comb begin
      unique case( 1'b1 )
	( subSample_RnnnnU[0] ): ss_w_lg2 = 3;
	( subSample_RnnnnU[1] ): ss_w_lg2 = 2;
	( subSample_RnnnnU[2] ): ss_w_lg2 = 1;
	( subSample_RnnnnU[3] ): ss_w_lg2 = 0;
      endcase
   end

   
   //Check that Bounding Box is Correct
   always @(posedge clk) begin
      if( validPoly_RnnH ) begin //check only when the polygon is valid
	 if(one != rastBBox_bbox_check( 
				     int'(poly_RnnS[0][0]), //uPoly
				     int'(poly_RnnS[0][1]), //uPoly
				     int'(poly_RnnS[1][0]), //uPoly
				     int'(poly_RnnS[1][1]), //uPoly
				     int'(poly_RnnS[2][0]), //uPoly
				     int'(poly_RnnS[2][1]), //uPoly
				     int'(poly_RnnS[3-1][0]), //uPoly
				     int'(poly_RnnS[3-1][1]), //uPoly
				     int'(isQuad_RnnH)    , //uPoly
				     int'(validPoly_RnnH)    , //uPoly
				     int'(box_R13S[0][0] ), //BBOX
				     int'(box_R13S[0][1] ), //BBOX
				     int'(box_R13S[1][0] ), //BBOX
				     int'(box_R13S[1][1] ), //BBOX
				     ss_w_lg2,                //Subsample
				     int'(screen_RnnnnS[0] ), //Screen
				     int'(screen_RnnnnS[1] ), //Screen
				     int'(validPoly_R13H),  //Polygon Valid
				     10,                   //Config
				     int'( 128'd1 << 10 )  //Congig 
				     )) begin

		 $fwrite( file , "@%0t: Bounding BOX ERROR!!\n" , $time );
	         $fwrite( file , "validPoly_RnnH=%b validPoly_R13H=%b", validPoly_RnnH, validPoly_R13H );

		 $fwrite( file , "\n\t\t" );
		 $fwrite( file , "uP.v_0.x: %f\t" ,  1.0 * poly_RnnS[0][0] / ( 128'd1 << 10 )    );
		 $fwrite( file , "uP.v_0.y: %f\t" ,  1.0 * poly_RnnS[0][1] / ( 128'd1 << 10 )    );
		 $fwrite( file , "uP.v_1.x: %f\t" ,  1.0 * poly_RnnS[1][0] / ( 128'd1 << 10 )    );
		 $fwrite( file , "uP.v_1.y: %f\t" ,  1.0 * poly_RnnS[1][1] / ( 128'd1 << 10 )    );

		 $fwrite( file , "\n\t\t" );		 
		 $fwrite( file , "uP.v_2.x: %f\t" ,  1.0 * poly_RnnS[2][0] / ( 128'd1 << 10 )    );
		 $fwrite( file , "uP.v_2.y: %f\t" ,  1.0 * poly_RnnS[2][1] / ( 128'd1 << 10 )    );
		 
		 if( isQuad_R13H ) begin
		    $fwrite( file , "uP.v_3.x: %f\t" ,  1.0 * poly_RnnS[3-1][0] / ( 128'd1 << 10 )    );
		    $fwrite( file , "uP.v_3.y: %f\t" ,  1.0 * poly_RnnS[3-1][1] / ( 128'd1 << 10 )    );
		 end

		 $fwrite( file , "\n\t\t" );
		 
		 $fwrite( file, "box.ll.x:%f\t",   1.0 * box_R13S[0][0] / ( 128'd1 << 10 )    );
		 $fwrite( file, "box.ll.y:%f\t",   1.0 * box_R13S[0][1] / ( 128'd1 << 10 )    );
		 $fwrite( file, "box.ur.x:%f\t",   1.0 * box_R13S[1][0] / ( 128'd1 << 10 )    );
		 $fwrite( file, "box.ur.y:%f\t",   1.0 * box_R13S[1][1] / ( 128'd1 << 10 )    );
	         $fwrite( file , "\n" );

	    if (~validPoly_R13H) begin
	       $fwrite( file , "\n\t\t" );
	       
	       $fwrite( file, "box_R12S[0][0] > screen_RnnnnS[0]:%b\n",  invalidate_RnnH[0][0] );
	       $fwrite( file, "box_R12S[0][1] > screen_RnnnnS[1]:%b\n",  invalidate_RnnH[0][1] );
	       $fwrite( file, "box_R12S[1][0] < 0:%b\n",  invalidate_RnnH[1][0] );
	       $fwrite( file, "box_R12S[1][1] < 0:%b\n",  invalidate_RnnH[1][1] );
	       $fwrite( file , "\n" );
	    end
	   assert(0) else $error("@%0t: ERROR: Bounding Box Check Failed", $time);
	end // if (one != rastBBox_bbox_check(...
      end // if ( validPoly_R13H )
   end // always @ (posedge clk)

   
	dff3_unq6  d_01 (
					 .in(poly_R10S) , 
				     .clk(clk) , .reset(rst), .en(halt_RnnnnL),
				     .out(poly_RnnS));
					 
	dff_unq11  d_02 (
					 .in({validPoly_R10H, isQuad_R10H}) , 
				     .clk(clk) , .reset(rst), .en(halt_RnnnnL),
				     .out({validPoly_RnnH, isQuad_RnnH}));

   
   always @(posedge clk) begin
      assert( rst | ( 3==3 && !isQuad_RnnH ) || 3==4 )
	else $error( "time=%10t ERROR: Saw a quad in a non-quad system", $time );
   end

   property sig_eq_con( rst, a , b , c );
      @(posedge clk) rst | ((a==b) | !c);
   endproperty

   //Check that signals should match
   assert property( sig_eq_con( rst, poly_RnnS[0][0] , poly_R13S[0][0]  , validPoly_RnnH )); 
   assert property( sig_eq_con( rst, poly_RnnS[0][1] , poly_R13S[0][1]  , validPoly_RnnH )); 
   assert property( sig_eq_con( rst, poly_RnnS[1][0] , poly_R13S[1][0]  , validPoly_RnnH )); 
   assert property( sig_eq_con( rst, poly_RnnS[1][1] , poly_R13S[1][1]  , validPoly_RnnH )); 
   assert property( sig_eq_con( rst, poly_RnnS[2][0] , poly_R13S[2][0]  , validPoly_RnnH )); 
   assert property( sig_eq_con( rst, poly_RnnS[2][1] , poly_R13S[2][1]  , validPoly_RnnH )); 
   assert property( sig_eq_con( rst, isQuad_RnnH     , isQuad_R13H      , validPoly_RnnH )); 
 
endmodule 
