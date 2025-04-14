info.entries[entrynr]{[4,5]};

bounds[n][k]{[i+1..Length(bounds[n][k])]};

blocks{equal[i]};

indices{ corefreepos };

IdentityMat( nrows, zero ){[1..nrows]}{L};

Immutable([-5,-3..5]){[2..3]};

deduped_8_1{[ (i_2 + 1) .. deduped_10_1 ]};

mealyel{[1,2,3,4,5, 7,8 ]}{[1,2,  5]};

deduped_14_1{[ 1 .. (i_2 - 1) ]};

chi{ fus };

gns{[1..Position(gns,fail)]};

bidegrees[2]{[ 1 .. lq - 1 ]};

GeneratorsOfGroup(f){[m+1..m+n]};

alpha1{[1..Length(gens)]};

tblnames[i]{ [ 1, j ] };

ew{[j+1..k]};

PositiveRoots( R ){pos};

g{emb!.range}{emb!.range};

gen[d+1]{[1..d]};

entry{ [ 3, 1, 2 ] };

gens{Concatenation([1 .. pos - 1],
                                  [pos + 1 .. Length(gens)])};

spec{Filtered( [1..Length(spec)],
                           x -> weights[x][3] = primes[i] )};

sgrps{[23, 21, 8, 30, 29, 5, 6, 20, 3, 24, 22, 7, 27, 26, 14,
                     11, 19, 2, 10, 13, 4, 17, 18, 16, 1, 9]};

LGFirst( spg ){[ 1..Position( 
                         LGFirst( spg ), head) ]};

ordblocks[ pos + j ]{
                            BasicSetBrauerTree( brauertree[ pos + j ] ) };

fuslist{ Filtered( [ 1 .. Length( fuslist ) ],
                                     i -> modfuslist[i] = modfus ) };

partition{ [ place + 1
                                     .. Length( partition ) ] };

LIBLIST.allnames{ Filtered( [ 1 .. Length( LIBLIST.position ) ],
                                         i -> LIBLIST.position[i] = pos ) };

list[ i ]{Filtered(
                    [ 1 .. Length( list[ i ] ) ], y -> finps[ y ] = x ) };

p{ Filtered( [1..Length(CartanMatrix(R))],
                                i -> d0.vec[i]=0 ) };

AtlasClassNames( t ){ Filtered( [ 1 .. Length( ord ) ],
       i -> cents[i] = 648 and cents[ PowerMap( t, 2 )[i] ] = 52488
                           and cents[ PowerMap( t, 3 )[i] ] = 26127360 ) };

initmessage{ [ PositionSublist(initmessage,"scscp_versions=")+16 .. 
                                     PositionSublist(initmessage,"\" ?>")-1 ] };

irrnam2[i][j]{ [
                          1 .. Length( irrnam2[i][j] ) -1 ]};

dco[i]{Filtered([1..Length(dco[i])],
                        k->lens[i][k]=j)};

OrdersTom( tom ){
                             MaximalSubgroupsTom( tom )[1] };

gens{Concatenation( [1..info.first[i]-1],
                           [info.first[i+1]..Length(gens)] )};

res[2][4]{ [ Position( res[2][4], '<' )
                               .. Length( res[2][4] ) ] };

GetFusionMap( 2fi22, tblNmodY ){
                ClassPositionsOfCentre( 2fi22 ) };

map_on_basis_coeffs
               { [ 1 .. Length( map_on_basis_coeffs ) ] }
               { target_space };

words[part[j]]{[pos[j] + 1 ..
                                                      Length(words[part[j]])]};
