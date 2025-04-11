if premap<>fail then hom:=premap*hom;fi;

if Length(e)=0 then return OneOfPcp( Pcp( H ) );fi;

if opt[3] then AddRowVector(Q[i],Q[j],-q); fi;

if not x in Source(i) then return fail; fi;

if m=fail then TryNextMethod();fi;

if r=0 then return Image(GhomE,R!.elts[d])*Image(HhomE,S!.elts[Order(H)]); fi;

if Length( free ) > 0 then Add( ref, B ); fi;

if Size(S) <> Size(CharacterTable("Fi23")) then Error("wrong size"); fi;

if (P mod 9) <> 1 then return false; fi;

if Size( G ) = 1 then return G; fi;

if a <> u then MyError(116); fi;

if a <> 2 then Error("hier"); fi;

if y>0 then Append(ans,GBNP.TransLetter(y)); fi;

if not IsParentLiePRing(L) then return fail; fi;

if not ord mod lv[1] = 0 then possible := false; fi;

if i > j+1 then new := Getbj(-(i-j-1)) * new; fi;

if Order(x)=prime then AddSet(core,x); fi;

if IsMutable(u) or IsMutable(u[1]) then MyError(190); fi;

if IsMutable(u) or IsMutable(u[1]) then MyError(98); fi;

if Length(x)>10 then Print("ArrayValueFunctions needs to be implemented for longer lists\n"); return fail;fi;

if IsProbablyPrimeInt(m) then Add(StandardFactorsList[1],m);
                               else Add(StandardFactorsList[2],m); fi;

if not Size(IndeterminatesOfPolynomialRing(pring)) = 1+pg!.dimension then
			Error("The dimension of the projective space should be 1 less than the number of indeterminates of the polynomial ring");
		fi;

if Length(MM) = 0 then 
            V_M := TrivialSubspace(K);
        else 
            V_M := VectorSpace(K,MM);
        fi;

if (r - 1) mod q = 0 then
      rootrq := a^((r-1)/q);
      Rootrq := Int(rootrq);
    fi;

if Length(arg) > 1  then
      Error("MakeHAPprimeDoc must have zero or one arguments.");
    fi;

if rel[1][1] = i and PPP_Equal( rel[1][2], Zero0 ) then
                     rel := [];
                  fi;

if not IsHomalgRingElement( el ) or not IsIdenticalObj( R, HomalgRing( el ) ) then
      el := HomalgRingElement( el, R );
    fi;

if not (IsGraph(ptgraph) and IsInt(s) and IsInt(t) and 
	IsInt(nspaces) and IsInt(printlevel)) 
    or (IsBound(arg[6]) and not IsList(arg[6])) then
   Error("usage: PartialLinearSpaces(",
	 "<Graph>, <Int>, <Int>, [<Int>, [<Int>, [<List>]]])");
fi;

if 1 in grid[i]{[1 .. j]}
                    then
                    if 1 in grid[i]{[j .. len]}
                        then
                        if 1 in List([1 .. i], x -> grid[x][j])
                            then
                            if 1 in List([i .. len], x -> grid[x][j])
                                then
                                return true;
                            fi;
                        fi;
                    fi;
                fi;

if n=2 then
Syz:= Syzygy(R,[g[1]]);
Syz:=AddFreeWords(Syz,Mult(g[1],Syzygy(R,[g[2]])));
Syz:=AddFreeWords(Syz,NegateWord(Syzygy(R,[g[1]*g[2]]))) ;
return Homotopy(1,Syz);
fi;

if a = 2 then Print("a\n"); Print("b\n"); elif a = 3 then Print("C"); fi;
if a = 2 then Print("a\n"); Print("b\n"); elif a = 3 then Print("C"); else Print("D"); fi;
if a = 2 then Print("a\n"); Print("b\n"); elif a = 3 then Print("C"); elif a = 100 then Print(C); Print(AA); else Print("D"); fi;
