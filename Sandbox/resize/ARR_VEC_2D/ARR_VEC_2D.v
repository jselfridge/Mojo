
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// ARR_VEC_2D.v
// Macro that resizes a 2D array into a vector.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

`define ARR_VEC_2D( ARR, ROW, COL, VEC) \
genvar r; \
generate \
for( r=0; r<ROW; r=r+1 ) begin: arr_vec_2d_loop \
assign \
VEC [ ( (COL*r) + (COL-1) ) : (COL*r) ] = \
ARR [r] [ (COL-1) : 0 ];\
end; \
endgenerate



