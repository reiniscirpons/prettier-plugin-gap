for l in max do Add( sums, Q[k][l] ); od;

for i in [1..l] do if a[i] <> -w[i] then MyError(36); fi; od;

for i in [1..Length(w)] do Add(w_list, track_l[w[i]]); od;

for k in orbs do Append( www, k[2] ); od;

for mm in lmax do mm!.type:="4bc";od;

for x in iter do od;

for i in setup.els[j] do ConvertToMatrixRep(i); od;

for i in [1..n] do AVLIndexAdd(t,i+17,true,2*i); od;

for i in [1..(Size(F)-1)/q[Size(q)]] do Add(inp,elm[i]); od;

for x in [1..2] do return; od;

for g in iter do od;

for a in groups do SetIsSolvableGroup(a,true); od;

for i in [1..len] do ones[i]:=1; od;

for i in gens2 do ConvertToMatrixRep(i,3); od;

for f in l do Print(f,"\n"); od;

for i in [1,9] do UF.UniteGAP(u,i, i+4); od;

for i in [1..d] do Add(auts,trans[i]^(-1)*trans[i^a]); od;

for x in it do nr := nr + 1; od;

for i in [1..count] do a := mm*nn; od;

for i in kq do Add(groups,Group(eps^(u/i))); od;
for j  in [2..n-k+1]  do
                sti[j] := (i+j-2) * sti[j-1] + sti[j];
            od;

for c in p{[2, 4 .. Length(p)]} do
        if c mod m <> 0 then return false; fi;
    od;

for i in [1..NrRows(mat)] do
            for j in [1..NrCols(mat)] do
                if copy[i,j] <> mat[i,j] then
                    return false;
                fi;
            od;
        od;

for z in [ k, k+1 .. j-1 ] do
              matrix[i][z]:= matrix[i][ z+1 ];
              MoveDelta( matrix[i][z], - bl, 0 );
            od;

for j in sel do
        if not IsBound(u[j]) then
          u[j]:=KernelOfMultiplicativeGeneralMapping(cl[j]);
        fi;
      od;

for k in [2,4..Length(vec)] do
            vec[k]:= ex[i+1]*vec[k];
        od;

for i in [1..Length(ac)] do
    for j in [1..Length(bc)] do
      pc[i+j-1]:=(pc[i+j-1]+ac[i]*bc[j]) mod p;
    od;
  od;

for comp in [ "Version", "DataURL", "SelfURL", "LocalDirectory" ] do
      if IsBound( inforec.( comp ) ) then
        Append( str, "\"" );
        Append( str, comp );
        Append( str, "\":\"" );
        Append( str, inforec.( comp ) );
        Append( str, "\",\n" );
      fi;
    od;

for i in [1..Length(h)] do
           eqns[i]:= [ ];
           for j in [1..Length(pi_0)] do
               Add( eqns[i], pi_0[j]*CT[i] );
           od;
           for j in [1..Length(pi_1)] do
               Add( eqns[i], pi_1[j]*CT[i] );
           od;
       od;

for elm in C do
        if func( elm ) then
            return true;
        fi;
    od;

for j in [1 .. n] do
			Add(g, Random([-10000, 10000]));
			Add(h, Random([-10000, 10000]));
		od;

for j in [1..Length(LL[i])-1] do
          T[i][LL[i][j]] := -1;
        od;

for i in [2..l] do
            Print(", ");
            x := ElmWPObj(wp,i);
            if x <> fail or IsBoundElmWPObj(wp,i) then
                ViewObj(x);
            fi;
        od;

for i in [1..Length(rules)] do
    Info(InfoCoh,1,"First rule ",i,", ",Length(BasisVectors(eqs))," equations");
    l1:=rules[i][1];
    len1:=Length(l1);
    for j in [1..Length(rules)] do
      l2:=rules[j][1];
      m:=Minimum(len1,Length(l2));
      for o in [1..m-1] do 
        start:=len1-o;
        if ForAll([1..o],k->l1[start+k]=l2[k]) then

          new:=Concatenation(rules[i][2],l2{[o + 1 .. Length(l2)]});
          c:=collectail(new);
          v1:=c[2];c:=c[1];
          if i in hastail then
            v1[i]:=v1[i]+mapped(l2{[o + 1 .. Length(l2)]});
          fi;

          new:=Concatenation(l1{[1 .. len1 - o]},rules[j][2]);
          v2:=collectail(new);
          if c<>v2[1] then Error("different in factor");
          fi;
          v2:=v2[2];
          if j in hastail then
            v2[j]:=v2[j]+one;
          fi;
          if v1<>v2 then 
            c:=List([1..dim],x->ShallowCopy(zeroq));
            for k in hastail do
              if v1[k]<>v2[k] then
                new:=TransposedMat(v1[k]-v2[k]);
                r:=(htpos[k]-1)*dim+[1..dim];
                for l in [1..dim] do
                  if not IsZero(new[l]) then
                    c[l]{r}:=new[l];
                  fi;
                od;
              fi;
            od;
            for k in c do

              if model<>fail and not IsZero(solvec*k) then
                Error("model does not fit");
              fi;
              k:=SiftedVector(eqs,k);
              if not IsZero(k) then
                CloseMutableBasis(eqs,ImmutableVector(field,k));

              fi;

            od;
          fi;

        fi;
      od;
    od;
    Add(olen,Length(BasisVectors(eqs)));
    if Length(olen)>3 and
      olen[Length(olen)]=olen[Length(olen)-2] and
      olen[Length(olen)]<>olen[Length(olen)-3] then

      k:=List(BasisVectors(eqs),ShallowCopy);;
      TriangulizeMat(k);
      eqs:=MutableBasis(field,
        List(k,x->ImmutableVector(field,x)),zeroq);
    fi;

  od;

for a in [1,P-1] do
                        for c in [0..P-1] do
                            if new = 1 then 
                                if (u*x) mod P = 1 then 
                                    e:=(c*u^-1) mod P;
                                else 
                                    e:=(-(c*u^-1+c*t)) mod P;
                                fi;
                                y1:=(e+c*u^-1+a*y+c*t) mod P;
                                z1:=(x*e-x*c*u^-1-2*e*u^-1+z*a+e*t) mod P;
                                if [t,y1,z1]<[t,y,z] then new := 0; fi;
                            fi;
                        od;
                    od;

for g in hc do  
        Print( g, "\n" ); 
    od;

for j in [1..i-1] do
    s[2*OurG+j]:=OurGamma[j]^y[i];
   od;

for p in [1..zero-1] do
                    if el[p] = zero then
                      Add(list, "_");
                    elif el[p] > zero then
                      Add(list, el[p]-1);
                    else
                      Add(list, el[p]);
                    fi;
                  od;

for i in [ 1 .. ncc1 ] do
        for j in [ 1 .. ncc2 ] do
          vals_direct[ j + ncc2 * ( i - 1 ) ]:= [ vals1[i], vals2[j] ];
        od;
      od;

for c in candidates do
        exps:=FactorizationsVectorWRTList(c,gens);
        rclass:=RClassesOfSetOfFactorizations(exps);
        if Length(rclass)>1 then
            pres:=Concatenation(pres,List([2..Length(rclass)],
                          i->Set([rclass[1][1],rclass[i][1]])));
        fi;
    od;
