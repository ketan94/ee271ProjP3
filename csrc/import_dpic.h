
 extern int zbuff_init(/* INPUT */int w, /* INPUT */int h, /* INPUT */int ss_w);

 extern int zbuff_rop(/* INPUT */int x, /* INPUT */int y, /* INPUT */int ss_x, /* INPUT */int ss_y, /* INPUT */int d, /* INPUT */int R, /* INPUT */int G, /* INPUT */int B);

 extern int write_ppm();

 extern int rastBBox_bbox_check(/* INPUT */int v0_x, /* INPUT */int v0_y, /* INPUT */int v1_x, /* INPUT */int v1_y, /* INPUT */int v2_x, /* INPUT */int v2_y, /* INPUT */int v3_x, /* INPUT */int v3_y, /* INPUT */int q, /* INPUT */int valid_Poly, 
/* INPUT */int ll_x, /* INPUT */int ll_y, /* INPUT */int ur_x, /* INPUT */int ur_y, /* INPUT */int ss_w_lg2, /* INPUT */int screen_w, /* INPUT */int screen_h, /* INPUT */int valid, /* INPUT */int r_shift, /* INPUT */int r_val
);

 extern int rastBBox_stest_check(/* INPUT */int v0_x, /* INPUT */int v0_y, /* INPUT */int v1_x, /* INPUT */int v1_y, /* INPUT */int v2_x, /* INPUT */int v2_y, /* INPUT */int v3_x, /* INPUT */int v3_y, /* INPUT */int q, /* INPUT */int s_x, 
/* INPUT */int s_y, /* INPUT */int hit);

 extern int rastBBox_check(/* INPUT */int v0_x, /* INPUT */int v0_y, /* INPUT */int v1_x, /* INPUT */int v1_y, /* INPUT */int v2_x, /* INPUT */int v2_y, /* INPUT */int v3_x, /* INPUT */int v3_y, /* INPUT */int q, /* INPUT */int hits, 
/* INPUT */int ss_w_lg2, /* INPUT */int screen_w, /* INPUT */int screen_h, /* INPUT */int r_shift, /* INPUT */int r_val);

 extern int rastBBox_jhash_jit_fix_check(/* INPUT */int s_x, /* INPUT */int s_y, /* INPUT */int ss_w_lg2, /* INPUT */int jitter_x, /* INPUT */int jitter_y, /* INPUT */int s_j_x, /* INPUT */int s_j_y);
