dim :=SCDim(complex);

LA:=Length(Identity(Image(f)));

f := 1;

len:= Length( mon );

dimsSet:=List(dims,d -> [1 .. d]);

x:=GreensRClasses(ParentAttr(class));

ParPres!.expo_vec := G!.expo_vec;

w := AsWordLetterRepInGenerators( x, FGA_Source( hom ));

b:=StructuralCopy(zero[n]);

i := 0;

S := NumericalSemigroup(7,8,17);

w0:= LongestWeylWord( R );

F:= B;

plane := VectorSpaceToElement(pg,mat2);

vv := ZeroMutable( gens[1][1] );

rngactrt := Range( actrt );

g := PartialPermNC([8], [100000]);

GUAVA_TEMP_VAR := false;

i := 3 - prj!.component;

p:=LookupDictionary(leaves,v);

goodpos:= Filtered( [1 .. Length(Monster_prim_data)],
                      i -> monstermaxindices[i] mod p <> 0 );

initialfile := Filename( dir,
                             Concatenation("upperbd",String(q),".g") );

possfus:= FusionsAllowedByRestrictions( 2m4, 2t, testcharsm4, ind,
       fus, parametersFABR );

longstring:=Concatenation(longstring, "label=\"", String(OrderVertex(v)),
                   "\";\n}\n");

5x5eq := [
[1, 1, 1, 1, 1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[1, 1, 1, 1, 1, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0],
[1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1],
[0, 1, 1, 1, 1, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0],
[1, 0, 1, 1, 1, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0],
[1, 1, 0, 1, 1, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0],
[1, 1, 1, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0],
[1, 1, 1, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1],
[0, 1, 1, 1, 1, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1],
[1, 1, 1, 1, 0, 0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 0, 0]
];

C!.lowerBoundMinimumDistance := Maximum(LowerBoundMinimumDistance(C1),
										   LowerBoundMinimumDistance(C2));

incompatnames:= List( incompat.badfusions,
          entry -> Concatenation( [ "  ", Identifier( entry[3] ),
                                    " -> ", Identifier( entry[4] ),
                                    " (w.r.t. ", Identifier( entry[1] ),
                                    " -> ", Identifier( entry[2] ), ")" ] ) );

sol:= List( NullspaceMat( eq ),
                        x -> LinearCombination( bQ, x ) );

SLAfcts.elm_to_seq:= function( M, u )

    local cf, e, i;

    cf:= Coefficients( CanonicalBasis(M), u );
    e:= [ ];
    for i in [1..Length(cf)] do
        if not IsZero(cf[i]) then
           Add( e, cf[i] ); Add( e, i ); 
        fi;
    od;

    return e;

end;

CmapG:=function(x);
return
PreImagesRepresentative(Embedding(C,2), Image(Embedding(C,1), Image(Projection(C),x)^-1) *x);
end;

gr := ReadDigraphs(
Concatenation(DIGRAPHS_Dir(), "/digraphs-lib/sts.g6.gz"), 1);

phi := Objectify( 
      NewType(NewFamily("HAPRingHomomorphismFamily"), 
        IsHAPRingHomomorphism and IsHAPRingToSubringHomomorphismRep), 
        rec());
