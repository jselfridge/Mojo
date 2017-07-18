
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// VEC_ARR_2D.v
// Macro that resizes a vector into a 2D array.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

`define VEC_ARR_2D( VEC, ROW, COL, ARR ) \
genvar r; \
generate \
for( r=0; r<ROW; r=r+1 ) begin: vec_arr_2d_loop \
assign \
ARR [r] [ (COL-1) : 0 ] = \
VEC [ ( (COL*r) + (COL-1) ) : (COL*r) ]; \
end; \
endgenerate



