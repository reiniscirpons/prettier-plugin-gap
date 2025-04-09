( pos2 = len or
               ( pos2 < len and entry[pos2 + 1] = ' ' ) );

((j0+q<=Size(ker)) and (q<2^(i0-1))
				and ker{[j0 .. j0 + q]}{[1 .. i0]} = LS{[1 .. q + 1]}
				and THELMA_INTERNAL_CheckZeroMat(ker{[j0 .. j0 + q]}{[i0 + 1 .. n]})=true);

( IsList( invmap[i] ) and
                   IsSubset( invpos, invmap[i] ) );

( IsList(approxfus[y]) and IsInt( x[y] )
                            and x[y] in approxfus[y] );

( STRINGIFY( "derivation by images: ", String( Range(obj) ), 
                       " -> ", String( Source(obj) ) ) );

( 0 <= val[2] or
                 ( 0 = val[2] and t.dynamic.mintime_orig = 0 ) );

(CanUseFroidurePin(S) or IsFpSemigroup(S) or IsFpMonoid(S)
      or (HasIsFreeSemigroup(S) and IsFreeSemigroup(S))
      or (HasIsFreeMonoid(S) and IsFreeMonoid(S)));

(IsGroupHomomorphism(group_iso) and
          IsBijective(group_iso) and
          Source(group_iso) = G1 and
          Range(group_iso) = G2);

(IsHapFilteredPureCubicalComplex(M) or 
IsHapFilteredPureCubicalComplex(M));

( HasIsGeneralMappingFromHomogeneousDiscrete( map ) 
           and IsGeneralMappingFromHomogeneousDiscrete( map ) );

( ( eps11*gamma = sigma*eps22 ) and 
             ( gamma*theta22 = theta11*sigma ) and 
             ( gamma*tau22 = tau11*sigma ) );

((IsBound(ind[k][6]) and IsBound(ind[l][6])
            and ind[k][6] = ind[l][6]) or
           (not IsBound(ind[k][6]) and not IsBound(ind[l][6])
           and ind[k][2] = ind[l][2]));

(     IsLieAlgebra( L )
             and IsMagmaRingModuloRelations( L )
             and LeftActingDomain( L ) = Rationals );

( ( tea = tl*el*tu*eu ) 
         and ( hea = hl*el*hu*eu ) 
         and ( tu*eu*hl*el = hl*el*tu*eu ) 
         and ( hu*eu*tl*el = tl*el*hu*eu ) );

(ObjectOfComplex(PC,lbound) <> Source( f ) or
        ObjectOfComplex(EC,lbound) <> Range( f ) );

(IsPrime(indexsub1) or IsPrime(indexsub2) or
                          indexsub1<>
                          indexsub2);

( ( i = 1 and p( 0 ) = true ) or
                                   ( 1 < i and p( i ) = true ) );

( Left2DimensionalMorphism( mor ) 
                   = Left2DimensionalMorphism( phi ) );

( HasIsNormalSubgroup2DimensionalGroup(PM) 
             and IsNormalSubgroup2DimensionalGroup(PM) );
