function gbtest43
%GBTEST43 test error handling
%
% All errors generated by this test are expected.

% SuiteSparse:GraphBLAS, Timothy A. Davis, (c) 2017-2020, All Rights Reserved.
% http://suitesparse.com   See GraphBLAS/Doc/License.txt for license.

rng ('default') ;
ok = true ;
G = GrB (magic (5)) ;

try
    x = prod (G, 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    x = min (G, [ ], 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    x = max (G, [ ], 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    x = min (G, [ ], 1, G) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    x = max (G, [ ], 1, G) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    x = sum (G, 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    x = all (G, 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    x = any (G, 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    [x, y] = bandwidth (G, 'lower') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    x = bandwidth (G, 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    x = GrB.eye (1, 2, 3) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    x = GrB.eye ([1, 2, 3]) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G.stuff = 3 ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G (2,1,1) = 3 ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

H = GrB (rand (4,3)) ;
try
    C = H^H ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = G^H ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = G^(-1) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = G(1,2).stuff(3,4) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = G.stuff ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = G (3:4) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = G (1,2,2) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = spones (G, 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = spones (G, G) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

G = GrB (magic (2), 'int16') ;
try
    C = eps (G)
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = GrB.entries (G, 'gunk')
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = GrB.entries (G, 'all', 'degree')
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = norm (G, 0) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = norm (G, 42) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = norm (G, -inf) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = norm (G, 2) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

v = GrB (rand (4,1)) ;
try
    C = norm (G, 42) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = reshape (v, 42, 42) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = reshape (v, [2 2 2]) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = zeros (3, 3, 'crud', G) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = zeros ([3, 3], 'crud', G) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = zeros (3, 3, 'like', G, 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = reshape (v, [2 2], 2) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = norm (v, 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = norm (v, 3) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = norm (G) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    v = GrB.bfs (v, 1) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    v = GrB.bfs (G, 1, 'gunk') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    % G must be symmetric
    v = GrB.bfs (G, 1, 'symmetric', 'check') ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    v = [G v] ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    v = [G ; v] ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = complex (GrB (1), GrB (1)) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = GrB.empty (4, 4) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = GrB.empty ([0, 4, 4]) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    c = GrB.tricount (v) ;
    ok = false
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    r = GrB.pagerank (rand (3,4)) ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

A = magic (5) ;
A (5,1) = 0 ;
G = GrB.prune (A) ;
try
    c = GrB.tricount (G, 'check') ;
    assert (false) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end

n = 10 ;
A = sprand (n, n, 0.4) ;
S = tril (A, -1) ;
S = S+S' ;
G = GrB (S) ;

try
    L = GrB.laplacian (G, 'uint8') ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    L = GrB.laplacian (A, 'double', 'check') ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    L = GrB.laplacian (S + speye (n), 'double', 'check') ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    DiGraph = digraph (GrB (ones (4,3))) ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok );

try
    DiGraph = digraph (GrB (ones (4)), 'crud') ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok );

clear d
d.in0 = 'crud' ;
try
    GrB.descriptorinfo (d) ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

clear d
d.in0 = 42 ;
try
    GrB.descriptorinfo (d) ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

clear d
d.nthreads = 'something' ;
try
    GrB.descriptorinfo (d) ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

clear d
d.chunk = 'something' ;
try
    GrB.descriptorinfo (d) ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    E = GrB.incidence (ones (4,3)) ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    E = GrB.incidence (ones (4), 'gunk') ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    Graph = graph (GrB (ones (4,3))) ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    Graph = graph (GrB (ones (4)), 'crud') ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = GrB.ktruss (rand (4), 2) ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = GrB.ktruss (rand (3,4)) ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

A = sprand (10, 10, 0.5) ;
try
    C = GrB.ktruss (A, 3, 'check') ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

A = A+A' ;
try
    C = GrB.ktruss (A, 3, 'check') ;
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

G = GrB (magic (2)) ;
try
    G = G (2:end)
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok)

try
    G = G (2:end, 1:end, 1:end)
    ok = false ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok)

try
    iset = GrB.mis (ones (3,4)) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    iset = GrB.mis (ones (3), 'gunk') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    iset = GrB.mis (ones (3), 'check') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

A = sprand (10, 10, 0.5) ;
try
    iset = GrB.mis (GrB.offdiag (A), 'check') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    iset = GrB.mis (ones (3)) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB (A, 'gunk') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB (A, 'gunk', 'crud') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB (4, 3, 'gunk') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB (4, 3, 'gunk', 'crud') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB (A, A) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB (A, A, A) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB (A, A, A, A) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.assign (A, {1}, {1}, {1}, pi) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.assign (A, '+', '+', {1}, {1}, pi) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.assign (A, A, A, A) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.assign (A, {1}, {1}) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.semiringinfo ('') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.mxm ('', 1, 1) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    c = GrB.reduce (ones (2), '+', '+', 1) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.monoidinfo ('/', 'double') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.monoidinfo ('') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.apply ('',1) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.extract (pi, {1}, {1}, {1}) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.extract (pi, pi, '+', '+', pi) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.extract (pi, pi, pi, pi) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.extract ('+') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.build (int8(1), int8(1), pi)
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.extract ('+', pi) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.select (pi, pi) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.extract (1i, {1}, {1}) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.extract (pi, {1}, {1}, struct ('kind', 'gunk')) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.extract (pi, {1}, {1}, struct ('format', 'gunk')) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    [i,j,x] = find (G, [3 4]) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    [i,j,x] = find (G, 3, 'crud') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    [i,j,x] = find (G, -1, 'first') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = flip (G, -1) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    C = flip (G, [2 2]) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.random (10, 10, 0.5, 'crud') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.random (rand (4,5), 'symmetric') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.random (10, 10, 10, 0.5) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.mxm ('to', 'many', 'strings') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.mxm (G, G, G, G, G) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    G = GrB.build (1:3, 1:4, 1:4) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.select ('tril', A) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.select (A, A, A, A, 'zero') ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

try
    GrB.extracttuples (A, struct ('base', 'crud')) ;
catch expected_error
    expected_error
    disp (expected_error.stack (end-1))
end
assert (ok) ;

fprintf ('gbtest43: all tests passed\n') ;

