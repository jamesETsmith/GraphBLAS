

//------------------------------------------------------------------------------
// GB_AxB:  hard-coded C=A*B and C<M>=A*B
//------------------------------------------------------------------------------

// SuiteSparse:GraphBLAS, Timothy A. Davis, (c) 2017-2019, All Rights Reserved.
// http://suitesparse.com   See GraphBLAS/Doc/License.txt for license.

//------------------------------------------------------------------------------

// Unless this file is Generator/GB_AxB.c, do not edit it (auto-generated)

#include "GB.h"
#ifndef GBCOMPACT
#include "GB_AxB__semirings.h"

// The C=A*B semiring is defined by the following types and operators:

// A*B function (Gustavon):  GB_AgusB__land_le_int64
// A'*B function (dot):      GB_AdotB__land_le_int64
// A*B function (heap):      GB_AheapB__land_le_int64
// C type:   bool
// A type:   int64_t
// B type:   int64_t
// Multiply: z = x <= y
// Add:      cij = (cij && z)
// MultAdd:  cij = (cij && (aik <= bkj))
// Identity: true
// Terminal: if (cij == false) break ;

#define GB_BUILTIN

#define GB_ATYPE \
    int64_t

#define GB_BTYPE \
    int64_t

#define GB_AX(pA) (Ax [pA])

// aik = Ax [pA]
#define GB_GETA(aik,Ax,pA) \
    int64_t aik = Ax [pA]

// bkj = Bx [pB]
#define GB_GETB(bkj,Bx,pB) \
    int64_t bkj = Bx [pB]

// multiply operator
#define GB_MULT(z, x, y)        \
    z = x <= y ;

// multiply-add
#define GB_MULTADD(z, x, y)     \
    z = (z && (x <= y)) ;

// copy scalar
#define GB_COPY(z,x) z = x ;

#define GB_IDENTITY \
    true

// break if cij reaches the terminal value
#define GB_DOT_TERMINAL(cij) \
    if (cij == false) break ;

// cij is not a pointer but a scalar; nothing to do
#define GB_CIJ_REACQUIRE(cij) ;

// save the value of C(i,j)
#define GB_CIJ_SAVE(cij) Cx [cnz] = cij ;

//------------------------------------------------------------------------------
// C<M>=A*B and C=A*B: gather/scatter saxpy-based method (Gustavson)
//------------------------------------------------------------------------------

#define GB_SAUNA_WORK(i) Sauna_Work [i]

#define GB_CX(p) Cx [p]

GrB_Info GB_AgusB__land_le_int64
(
    GrB_Matrix C,
    const GrB_Matrix M,
    const GrB_Matrix A, bool A_is_pattern,
    const GrB_Matrix B, bool B_is_pattern,
    GB_Sauna Sauna
)
{ 
    bool *restrict Sauna_Work = Sauna->Sauna_Work ;
    bool *restrict Cx = C->x ;
    GrB_Info info = GrB_SUCCESS ;
    #include "GB_AxB_Gustavson_meta.c"
    return (info) ;
}

//------------------------------------------------------------------------------
// C<M>=A'*B, C<!M>=A'*B or C=A'*B: dot product
//------------------------------------------------------------------------------

GrB_Info GB_AdotB__land_le_int64
(
    GrB_Matrix *Chandle,
    const GrB_Matrix M, const bool Mask_comp,
    const GrB_Matrix A, bool A_is_pattern,
    const GrB_Matrix B, bool B_is_pattern
)
{ 
    GrB_Matrix C = (*Chandle) ;
    bool *restrict Cx = C->x ;
    bool cij ;
    GrB_Info info = GrB_SUCCESS ;
    #include "GB_AxB_dot_meta.c"
    return (info) ;
}

//------------------------------------------------------------------------------
// C<M>=A*B and C=A*B: heap saxpy-based method
//------------------------------------------------------------------------------

#include "GB_heap.h"

GrB_Info GB_AheapB__land_le_int64
(
    GrB_Matrix *Chandle,
    const GrB_Matrix M,
    const GrB_Matrix A, bool A_is_pattern,
    const GrB_Matrix B, bool B_is_pattern,
    int64_t *restrict List,
    GB_pointer_pair *restrict pA_pair,
    GB_Element *restrict Heap,
    const int64_t bjnz_max
)
{ 
    GrB_Matrix C = (*Chandle) ;
    bool *restrict Cx = C->x ;
    bool cij ;
    int64_t cvlen = C->vlen ;
    GrB_Info info = GrB_SUCCESS ;
    #include "GB_AxB_heap_meta.c"
    return (info) ;
}

#endif

