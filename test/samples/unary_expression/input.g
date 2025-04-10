-infinity;

not SCIsSimplicialComplex(c);

-1;

-110;

-1;

-1;

-1;

-1;

-1;

-4;

-1;

-1;

not(IsRecord(data));

-2;

-1;

-infinity;

-1;

not IsXModAlgebra( PM );

-3;

-1;

-1\
;

not comment in [ "system setter",
                                 "default method, does nothing" ];

-3\
;

not (CanUseFroidurePin(S) or IsFpSemigroup(S) or IsFpMonoid(S)
      or (HasIsFreeSemigroup(S) and IsFreeSemigroup(S))
      or (HasIsFreeMonoid(S) and IsFreeMonoid(S)));

not
       IsBound(r.attributes.Label);

not ( Length( CoefficientsAndMagmaElements( g ) ) = 2 and
                     CoefficientsAndMagmaElements( g )[2] = 1 );

-2\
;

-1\
;

not ( ( attr.type = "values" and IsList( data ) ) or
             ( attr.type = "pairs" and IsRecord( data ) ) );

not TestConsistencyMaps( powermaps, fus[2],
               ComputedPowerMaps( tbls2G[2] ) );

-1\
;

not IsSubset( ClassPositionsOfCentre( tblmG ),
                       ClassPositionsOfKernel( mGfusG ) );

not ( IsBound( HOMALG.SuppressParityInViewObjForCommutativeStructureObjects )
             and HOMALG.SuppressParityInViewObjForCommutativeStructureObjects = true );

-\
2;

-4\
;

not ( ( Source( m1 ) =  Source( m2 ) ) 
            and ( Range( m1 ) = Range( m2 ) ) );

not (IsString( collector ) and
                (collector = "single" or collector = "combinatorial"));

not ForAll(GeneratorsOfGroup(group),
                  x -> IsSubset(include, OnTuples(include, x)));
