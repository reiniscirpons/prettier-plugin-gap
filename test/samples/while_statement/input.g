while h <= Length(d) and d[h] = 0 do h := h+1; od;

while cpos > 0 and (str[cpos] in " \t") do cpos := cpos - 1; od;

while i > 0 and IsZero(v[pivs[i]]) do i := i - 1; od;

while v[j] >= d[j] do v[j]:= v[j]-d[j]; od;

while gaussCode[1][1][beg]>0 do beg:=beg+1; od;

while gaussCode[1][1][i+1]>0 do i:=i+1; Add(arc1,gaussCode[1][1][i]); od;

while n mod (q * p) = 0  do q := q * p;  l := l + 1;  od;

while j <= length and rel[j] = num1 do  j := j + 1;  od;

while not IsOne(g^(p^e)) do g:=g^p; od;

while not IsDoneIterator( o ) do Add( wts1, NextIterator(o) ); od;

while Size(tempw)<Size(zlist[Size(zlist)]) do Add(tempw,0); od;

while not(IsIdle(wf)) do DoQueues(wf,true); Print(".\c"); od;

while v[j] < 0 do v[j]:= v[j]+d[j]; od;

while i <= Length(M) and M[i][c] = zero do i := i+1; od;

while h <= Length(d) and d[h] = 0 do h := h+1; od;

while n mod p = 0  do Add( factors, p );  n := QuoInt(n, p);  od;

while h <= Length(d) and d[h] = 0 do h := h+1; od;

while h[j] <> m_a do j:= j+1; od;

while h[j] <> m_a do j:= j-1; od;

while n mod p = 0  do Add( factors, p );  n := n / p;  od;
while l < gexps[k] do
                            x := y * (ggens[k] ^ l);
                            if Image( hom, x ) in im[k+1]  then
                                y := x;
                                l := gexps[k];
                            else
                                l := l + 1;
                            fi;
                        od;

while j<Length(dom)
        and IndexNC(dom[i-1],dom[j+1])<=2000 do
        j:=j+1;
      od;

while iso = fail do
      i := i + 1;
      if i mod 10 = 0 then
         Info( InfoRandIso, 3, i, " test on generating set candidates" );
      fi;
      if gens1 = [] then
         gens := ShallowCopy( GeneratorsOfGroup( G ) );
      else
         gens := List( coc1, Random );
      fi;
      if Size( Group( gens ) ) = size then
         code := CodeGenerators( gens, spcgs1 );
         p := Position( codes2, code.code );
         if p <> fail then
            iso := GroupHomomorphismByImagesNC( G, H, code.pcgs,
                                 CodeGenerators( gens2[ p ], spcgs2 ).pcgs );
         fi;
         if not code.code in codes1 then
            Add( codes1, code.code );
            Add( gens1, gens );
         fi;
      fi;
      if iso = fail then
         if gens2 = [] then
            gens := ShallowCopy( GeneratorsOfGroup( H ) );
         else
            gens := List( coc2, Random );
         fi;
         if Size( Group( gens ) ) = size then
            code := CodeGenerators( gens, spcgs2 );
            p := Position( codes1, code.code );
            if p <> fail then
               iso := GroupHomomorphismByImagesNC( G, H,
                       CodeGenerators( gens1[ p ], spcgs1 ).pcgs, code.pcgs);
            fi;
            if not code.code in codes2 then
               Add( codes2, code.code );
               Add( gens2, gens );
            fi;
         fi;
      fi;
   od;

while i<=Length(n)-1 do
    j:=i;
    ea:=true;
    repeat
      j:=j+1;
      ran:=[n[i]..n[j]-1]; 
      o:=Set(ro{ran});
      if Length(o)>1 then
        ea:=false; 
      fi;
      o:=o[1];
      if ForAny(p{ran},x->DepthOfPcElement(p,x^o)<n[j]) then
        ea:=false; 
      fi;
      if ForAny(p{ran},
                k->ForAny(p{ran},x->DepthOfPcElement(p,Comm(x,k))<n[j])) then
        ea:=false; 
      fi;
    until ea=false or j=Length(n);
    if ea=false then
      j:=j-1; 
      if j=i then
        return false; 
      fi;
      Add(n2,n[j]);
      i:=j;
    else
      Add(n2,n[j]);
      i:=j+1;
    fi;
  od;

while not aut in stabilizer do
            aut:= ( aut ^ 2 ) mod N;
            NN:= NN * 2;
          od;

while i <> fail do
    Add(extr, res{[i+5..PositionSublist(res, "</pre>", i)-1]});
    i := PositionSublist(res, "<pre>\n@", i);
  od;

while lenred do
            e := w[k2];
            ie := InvolutoryArcs( dig )[e];
            v := adig[e][2];
            gv := gps[ Position( vdig, v ) ];
            if isfp then
                isid := ( ( Length( w[k2-1]![1] ) = 0 ) and ( w[k2-2] = ie ) );
            else
                isid := ( ( w[k2-1] = ( ) ) and ( w[k2-2] = ie ) );
            fi;
            if isid then
                u := adig[e][3];
                gu := gps[ Position( vdig, u ) ];
                if isfp then
                    ng := NormalFormKBRWS( gu, w[k2-3]*w[k2+1] );
                else
                    ng := w[k2-3]*w[k2+1];
                fi;
                w := Concatenation( w{[1..k2-4]}, [ng], w{[k2+2..lw]} );
                len := len - 2;
                lw := lw - 4;
                Info( InfoGroupoids, 1, "k = ", k, ", shorter w = ", w );
                if ( len = 0 ) then
                     rw := GraphOfGroupsWordNC( gg, u, w );
                     SetTailOfGraphOfGroupsWord( rw, u );
                     SetHeadOfGraphOfGroupsWord( rw, u );
                     return rw;
                else
                     k := k-2;
                     k2 := k2-4;
                     lenred := ( k > 1 );
                fi;
            else
                lenred := false;
            fi;
        od;

while q<>fail  do
        if q=pos or cls[q].representative /
            cl.representative in K then
          c:=candidates[q] ^ opr[q];
          i:=Position(cl.candidates, c);
          if i=fail then
            Add(cl.candidates, c);
            Add(team, [q]);
          else
            Add(team[i], q);
          fi;
          blist[q]:=true;
        fi;
        q:=Position(blist, false, q);
      od;

while i <= Size(word) do
            if word[i] <> '(' then
                if product = "" then
                  product := chartoel(word[i]);
                else
                  product := product * chartoel(word[i]);
                fi;
            else
                lbracket := i;
                rbracket := -1;
                nestcount := 0;
                i := i + 1;
                while i <= Size(word) do
                    if word[i] = '(' then
                        nestcount := nestcount + 1;
                    elif word[i] = ')' then
                        if nestcount = 0 then
                            rbracket := i;
                            break;
                        else
                            nestcount := nestcount - 1;
                        fi;
                    fi;
                    i := i + 1;
                od;
                if rbracket = Size(word) or (not word[rbracket + 1] = '^') then
                    if product = "" then
                      product := RemoveBrackets(
                                 word{[lbracket + 1 .. rbracket - 1]});
                    else
                      product := product *
                                 RemoveBrackets(
                                 word{[lbracket + 1 .. rbracket - 1]});
                    fi;
                else
                    i := i + 2;
                    while i <= Size(word) do
                        if word[i] in "0123456789" then
                            i := i + 1;
                        else
                            break;
                        fi;
                    od;

                    p := Int(word{[rbracket + 2 .. i - 1]});
                    if p = 0 then
                      ErrorNoReturn("expected ^ to be followed",
                                    " by a positive integer but found 0");
                    fi;
                    if product = "" then
                       product := RemoveBrackets(word{[lbracket + 1 ..
                                                       rbracket - 1]}) ^ p;
                    else
                       product := product *
                                  RemoveBrackets(word{[lbracket + 1 ..
                                                       rbracket - 1]}) ^ p;
                    fi;
                    i := i - 1;
                fi;
            fi;
            i := i + 1;
        od;

while not deleted and k<lengthList do
	    k := k+1;
	    if Order(reps[k]) = ord and rep in NList[k] then
		Unbind(NList[i]);
		deleted := true;
	    fi;
          od;

while bool do
      bool:=Contract(nn);
      if bool=true then BOOL:=true; fi;
    od;

while pos <= len and dp = depth[pos] do
                    y := ReducedPcElement(ppcgs, y, gens[pos]);
                    dp := DepthOfPcElement(ppcgs, y);
                    pos := PositionSorted(depth, dp);
                od;

while i <= Length(res) do
          res[i] := -res[i];
          i := i+2;
        od;

while (r <= k-Dimension(A[i])) do
			GX[r]:=ShallowCopy(GX[r]);;
			Append(GX[r], ZeroVec);;
			r := r + 1;;
		od;

while i>0 do
      v:=ShallowCopy(new[i]);
      Info(InfoMatInt,3,"Process ",i);
      Unbind(new[i]); 
      i:=i-1;
      clean:=true;
      p:=PositionNonZero(v);
      while p<=n and pip[p]<>fail do
        if v[p] mod piv[p]=0 then
          AddRowVector(v,mat[pip[p]],-QuoInt(v[p],piv[p]));
          p:=PositionNonZero(v,p);
        elif clean and piv[p] mod v[p]=0 then
          v:=nv(v);
          Info(InfoMatInt,2,"Replace pivot ",piv[p],"@",p," to ",v[p]);
          w:=mat[pip[p]];
          assign(p,v);
          pin[p]:=v*v;
          piv[p]:=v[p];
          v:=w;
          AddRowVector(v,mat[pip[p]],-QuoInt(v[p],piv[p]));
          p:=PositionNonZero(v,p);
        else
          g:=Gcdex(v[p],piv[p]);
          w:=g.coeff2*mat[pip[p]];
          AddRowVector(w,v,g.coeff1); 
          now:=w*w;
          if (not clean) or now>rat*pin[p] then
            AddRowVector(v,mat[pip[p]],-QuoInt(v[p],piv[p]));
            p:=PositionNonZero(v,p);
            clean:=false;
          else
            Info(InfoMatInt,2,"Reduce pivot ",piv[p],"@",p," to ",g.gcd);
            new[i+1]:=v; 
            new[i+2]:=mat[pip[p]];
            i:=i+2;
            assign(p,w);
            piv[p]:=w[p];
            pin[p]:=now;
            p:=fail; 
          fi;

        fi;
      od;
      if not clean then
        Add(extra,v);
      elif p<=n then
        v:=nv(v); 
        pip[p]:=Length(mat)+1;
        assign(p,v);
        Info(InfoMatInt,1,"Added @",Length(mat));
        piv[p]:=v[p];
        pin[p]:=v*v;
      fi;
    od;

while not( rules = newrules ) do 
        rules := newrules;
        newrules := RewriteReduce( mG, OnePassKB( mG, rules) );
        passes := passes + 1;
        if ( InfoLevel( InfoIdRel ) > 2 ) then 
            Print( "number of rules generated = ", Length(rules), "\n" );
            Print( "rules = ", rules, "\n" );
            Print( "passes = ", passes, "\n" );
        fi;
    od;

while true do
        sca:= SCAlgebraInfoOfFpLieAlgebra( L, rels, bound, false, false );
        if sca <> fail then
          return sca.sc;
        else
          bound:= bound + 1000;
        fi;
      od;

while i <= Length(states) do
                t := [];
                o := [];
                for a in T do
                    y := a*states[i];
                    if IsRightTransversal(T) then
                        p := PositionCanonical(T,y);
                    else
                        p := First([1..Length(T)],i->y*T[i] in Source(phi));
                    fi;
                    if p=fail then return fail; fi;
                    Add(o,p);
                    y := (y/T[p])^phi;
                    p := Position(states,y);
                    if p=fail then
                        Add(states,y);
                        Add(t,Length(states));
                    else
                        Add(t,p);
                    fi;
                od;
                Add(trans,t);
                Add(out,o);
                if not ISINVERTIBLE@(o) then return fail; fi;
                i := i+1;
                if RemInt(i,10)=0 then
                    Info(InfoFR, 2, "FRGroupByVirtualEndomorphism: at least ",i," states");
                fi;
            od;

while Length(p) < deg do
      Add(p, 0*p[1]);
    od;

while j<Length(OurBase) do
            if IsBound(rr[k][OurBase[j]^cc[i]]) then
                k:=rr[k][OurBase[j]^cc[i]];
            else
                Add(rr,[]);
                rr[k][OurBase[j]^cc[i]]:=Length(rr);
                k:=Length(rr);
            fi;
            j:=j+1;
        od;
