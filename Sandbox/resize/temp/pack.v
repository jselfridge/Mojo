
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// pack.v
// Defines macros for packing/unpacking multi-dimension vectors.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

//`define PACK_ARRAY(PK_WIDTH,PK_LEN,PK_SRC,PK_DEST) \
//genvar pk_idx;\
//generate\
//for(pk_idx=0;pk_idx<(PK_LEN);pk_idx=pk_idx+1)begin:pack_loop\
//assign PK_DEST[((PK_WIDTH)*pk_idx+((PK_WIDTH)-1)):((PK_WIDTH)*pk_idx)] = PK_SRC[pk_idx][((PK_WIDTH)-1):0];\
//end;\
//endgenerate

//`define UNPACK_ARRAY(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) \
//genvar unpk_idx;\
//generate\
//for(\
//unpk_idx=0;\
//unpk_idx<(PK_LEN);\
//unpk_idx=unpk_idx+1)\
//begin:unpack_loop\
//assign \
//PK_DEST[unpk_idx][((PK_WIDTH)-1):0] = \
//PK_SRC[((PK_WIDTH)*unpk_idx+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx)];\
//end;\
//endgenerate

`define VEC2ARR(VEC,ROW,COL,ARR) \
genvar rva;\
generate\
for(rva=0;rva<ROW;rva=rva+1)begin:vec2arr_loop\
assign \
ARR[rva][(COL-1):0] = \
VEC[((COL*rva)+(COL-1)):(COL*rva)];\
end;\
endgenerate

`define ARR2VEC(ARR,ROW,COL,VEC) \
genvar rav;\
generate\
for(rav=0;rav<ROW;rav=rav+1)begin:arr2vec_loop\
assign \
VEC[((COL*rav)+(COL-1)):(COL*rav)] = \
ARR[rav][(COL-1):0];\
end;\
endgenerate


