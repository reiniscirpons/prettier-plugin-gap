function(a, b)
  return a > b;
end;
function(stream)
  INPUT_LOG_TO_STREAM(stream);
end;
function(o)
  return "XYZ";
end;
function()
  MakeReadWriteGlobal(w);
  UnbindGlobal(w);
end;
function(x...)
  return x;
end;
function(h)
  result.height := h;
end;
function(h)
  result.layout := rec(height := h);
end;
function(r, m)
  return ResidueClass(Integers, m, r);
end;
function(t)
  result.chart.type := t;
end;
function()
  unknownvarname := 1;
end;
function(u, v)
  return LtNP(u[3], v[3]);
end;
function(t1, t2)
  return t1[1] = t2[1];
end;
function()
  Display(obj);
end;
function()
  return function()

  end;
end;
function(x, y)
  return [x, y];
end;
function(m)
  Print(DisplayString(m), "\n");
end;
function(x)
  x(1);
end;
function(m1, m2)
  return [];
end;
function(x)
  ;
  return x;
end;
function(cs)
  Print(ViewString(cs));
end;
function(v)
  Print("<element of type ", v!.type, " of ");
  ViewObj(v!.geo);
  Print(">");
end;
function(E, s)
  return VECTORMINIMIZE@(
    FamilyObj(E), LeftActingDomain(E), E!.transitions, E!.output, s, 2, false
  );
end;
function(Functor, p)
  local name;
  name := NameOfFunctor(Functor);
  name := Concatenation("S", name);
  return RightSatelliteOfCofunctor(Functor, p, name);
end;
function(o, m)
  local w;
  if IsBound(o!.scc_reps[m]) then
    return o!.scc_reps[m];
  fi;
  w := TraceSchreierTreeForward(o, OrbSCC(o)[m][1]);
  o!.scc_reps[m] := EvaluateWord(o, Reversed(w));
  if not IsIdealOrb(o) then
    o!.scc_reps[m] := o!.scc_reps[m] * o!.scc_reps[1];
  fi;
  return o!.scc_reps[m];
end;
function(x, n)
  local pos;
  if IsZero(n) then
    return FamilyObj(x)!.zeroVector;
  else
    pos := x![2];
  fi;
  return PathAlgebraVectorNC(FamilyObj(x), n * x![1], pos, IsNormalForm(x));
end;
function(n, kappa)
  local word;
  if Length(kappa) = n then
    return [[1, kappa]];
  else
    word := BCH_Comm2Word(kappa);
    return BCH_ComputeCoefficientsAndBracketWord(n, word);
  fi;
end;
function(x)
  ;
  return Length(Filtered(x, i -> IsEvenInt(i)));
end;
function(d, q)
  local k, list, delta, i, count, list2;
  delta := (q + 1) * Gcd(q + 1, d);
  if d mod 2 = 1 then
    k := Int(d / 2);
    list := [
        (q ^ (d - 2) + 1) * q * (q + 1) / delta,
        (q ^ (d - 1) - 1) * (q + 1) / delta
      ];
    if k in [1, 2, 4] then
      Add(list, (q ^ d + 1) / delta);
      return list;
    else
      Add(list, (q ^ a(d) + 1) * (q ^ (d - a(d)) - 1) / delta);
      return list;
    fi;
  fi;
  if d = 4 and q = 3 then
    return [12, 9, 8, 7];
  fi;
  if d = 6 and q = 5 then
    return [630, 624, 521];
  fi;
  if d mod 2 = 0 and d mod (q + 1) = 0 and not ([d, q] in [[4, 3], [6, 5]]) then
    list := [
        q ^ (d - 2) + q, q ^ (d - 2) - 1,
        (q ^ a(d - 1) + 1) * (q ^ (d - 1 - a(d - 1)) - 1) / (q + 1)
      ];
    for i in [3 .. d - 4] do
      if Gcd(i, d - 2 - i) = 1 and i mod 2 = 1 then
        Add(list, q * (q ^ i + 1) * (q ^ (d - 2 - i) + 1) / (q + 1));
      fi;
    od;
    list := reverse(Set(list));
    count := 0;
    i := 0;
    list2 := [];
    repeat
      i := i + 1;
      Add(list2, list[i]);
      if list[i] mod q > 0 then
        count := count + 1;
      fi;
    until count = 2;
    return list2;
  fi;
  if d mod 2 = 0 and d mod (q + 1) > 0 then
    k := d / 2;
    list := [
        (q ^ (d - 1) + 1) * (q + 1) / delta,
        (q ^ (d - 2) - 1) * q * (q + 1) / delta
      ];
    if k in [2, 3] then
      Add(list, (q ^ d - 1) / delta);
      return list;
    else
      Add(list, (q ^ (d - a(d)) + 1) * (q ^ a(d) + 1) / delta);
      return list;
    fi;
  fi;
end;
function(cat_1, alpha_1)
  local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1;
  deduped_4_1 := UnderlyingRing(cat_1);
  deduped_3_1 := Range(alpha_1);
  deduped_2_1 := UnderlyingMatrix(deduped_3_1);
  deduped_1_1 := NumberColumns(deduped_2_1);
  return CreateCapCategoryMorphismWithAttributes(
    cat_1,
    deduped_3_1,
    CreateCapCategoryObjectWithAttributes(
      cat_1,
      UnderlyingMatrix,
      UnionOfRows(
        deduped_4_1, deduped_1_1, [deduped_2_1, UnderlyingMatrix(alpha_1)]
      )
    ),
    UnderlyingMatrix,
    HomalgIdentityMatrix(deduped_1_1, deduped_4_1)
  );
end;
function(gen)
  local R;
  R := HomalgRing(gen);
  return Subobject(gen, NumberColumns(gen) * R);
end;
function(R, length, primes)
  local P, diff, p, parts, part, i, j;
  if not (IsIntegers(R) or IsZ_pi(R)) or not ForAll(primes, IsInt) or
      not ForAll(primes, IsPrime) then
    TryNextMethod();
  fi;
  if IsZ_pi(R) then
    primes := Intersection(primes, NoninvertiblePrimes(R));
  fi;
  parts := Filtered(Partitions(length - 1), part -> IsSubset(primes - 1, part));
  if IsEmpty(parts) then
    return fail;
  fi;
  part := Random(parts);
  P := [R];
  for i in [1 .. Length(part)] do
    p := part[i] + 1;
    j := Random([1 .. Length(P)]);
    P[j] := SplittedClass(P[j], p);
    P := Flat(P);
  od;
  return Set(P);
end;
function(g)
  local lst, gens, i;
  lst := [];
  gens := GeneratorsOfGroup(g);
  for i in [1 .. Length(gens)] do
    Add(lst, TypesetInternal(gens[i]));
  od;
  return lst;
end;
function(U)
  local U0, R, posR, sim, rank, noR, g, ims, i, f;
  if IsGenericQUEA(U) then
    U0 := U;
  else
    U0 := QuantizedUEA(RootSystem(U));
  fi;
  R := RootSystem(U0);
  posR := PositiveRootsInConvexOrder(R);
  sim := SimpleSystemNF(R);
  rank := Length(sim);
  noR := Length(posR);
  g := GeneratorsOfAlgebra(U0);
  ims := [];
  for i in [1 .. rank] do
    Add(ims, g[Position(posR, sim[i])]);
  od;
  for i in [1 .. rank] do
    Add(ims, g[noR + 2 * i]);
  od;
  for i in [1 .. rank] do
    Add(ims, g[noR + 2 * i - 1]);
  od;
  for i in [1 .. rank] do
    Add(ims, g[Position(posR, sim[i]) + 2 * rank + noR]);
  od;
  f := QEAAntiAutomorphism(U0, ims);
  if IsGenericQUEA(U) then
    SetIsqReversing(f, false);
    return f;
  else
    return QEAAntiAutomorphism(U, f);
  fi;
end;
function(cat, list)
  #% CAP_JIT_RESOLVE_FUNCTION
  return UniversalMorphismIntoDirectSum(cat, List(list, Range), list);
end;
function(exp, p)
  return APEndoNC(IdentityMat(Length(exp)), exp, p);
end;
function(G, R, F, n)
  local C, P, DCRS, DCRS1, DCRSpruned, L, Y, GroupL, X, K, gensK, S, f, fx, P1, HP,
    HK, HPK, HKhomHPK, HPKhomHP, HKhomHP, HKx, HPKx, HKxhomHPKx, HPKxhomHP, HKxhomHP,
    HKhomHKx, HKhomHP2, HPrels, x, y, i, prime, core, conjs, conjelt, CentP, HPpres,
    G1, epi, HPP, rho, bool, eqmap;
  C := F(R);
  P := Group(SmallGeneratingSet(R!.group));
  HP := GroupHomomorphismByFunction(P, P, x -> x);
  HP := EquivariantChainMap(R, R, HP);
  HP!.conjugator := Identity(P);
  HP := F(HP);
  HP := Homology(HP, n);
  HP := Source(HP);
  HPrels := [Identity(HP)];
  if Length(AbelianInvariants(HP)) = 0 then
    return [];
  fi;
  P1 := Normalizer(G, P);
  prime := Factors(Order(P))[1];
  if not IsPrimeInt(Order(P)) then
    DCRS1 := List(DoubleCosetRepsAndSizes(G, P1, P1), x -> x[1]);
  else
    DCRS1 := [];
  fi;
  if Order(P1) > Order(P) then
    Append(
      DCRS1,
      Filtered(ReduceGenerators(GeneratorsOfGroup(P1), P1), x -> not x in P)
    );
  fi;
  core := [];
  for x in P do
    if Order(x) = prime then
      AddSet(core, x);
    fi;
  od;
  DCRS := [];
  for x in DCRS1 do
    for y in core do
      if x * y * x ^ -1 in core then
        Add(DCRS, x);
        break;
      fi;
    od;
  od;
  DCRSpruned := [];
  conjs := [];
  conjelt := [];
  for x in DCRS do
    Y := Intersection(P, P ^ x);
    AddSet(conjs, Y);
    Append(conjelt, [[x, Y]]);
  od;
  for Y in conjs do
    L := Filtered(conjelt, x -> x[2] = Y);
    L := List(L, x -> x[1]);
    GroupL := Group(L);
    Add(DCRSpruned, ReduceGenerators(L, GroupL));
  od;
  DCRSpruned := Filtered(DCRSpruned, x -> Length(x) > 0);
  for L in DCRSpruned do
    K := Intersection(P, P ^ L[1]);
    gensK := ReduceGenerators(GeneratorsOfGroup(K), K);
    if not Length(gensK) = 0 then
      G1 := Group(gensK);
      if Order(G1) < 64 and n < 4 then
        S := ResolutionFiniteGroup(gensK, n + 1);
        S!.group := Group(SmallGeneratingSet(S!.group));
      else
        S := ResolutionNormalSeries(LowerCentralSeries(G1), n + 1);
        S!.group := Group(SmallGeneratingSet(S!.group));
      fi;
      if not (Homology(F(S), n) = []) then
        f := GroupHomomorphismByFunction(K, P, x -> x);
        eqmap := EquivariantChainMap(S, R, f);
        eqmap!.conjugator := Identity(S!.group);
        HKhomHPK := Homology(F(eqmap), n);
        HK := Source(HKhomHPK);
        HPK := Range(HKhomHPK);
        HPKhomHP := GroupHomomorphismByImagesNC(
            HPK, HP, GeneratorsOfGroup(HPK), GeneratorsOfGroup(HP)
          );
        HKhomHP := GroupHomomorphismByFunction(
            HK, HP, x -> Image(HPKhomHP, Image(HKhomHPK, x))
          );
        for X in L do
          fx := GroupHomomorphismByFunction(K, P, g -> Image(f, g) ^ (X ^ -1));
          eqmap := EquivariantChainMap(S, R, fx);
          eqmap!.conjugator := X ^ -1;
          HKxhomHPKx := Homology(F(eqmap), n);
          HKx := Source(HKxhomHPKx);
          HPKx := Parent(Range(HKxhomHPKx));
          HPKxhomHP := GroupHomomorphismByImagesNC(
              HPKx, HP, GeneratorsOfGroup(HPKx), GeneratorsOfGroup(HP)
            );
          HKxhomHP := GroupHomomorphismByFunction(
              HKx, HP, x -> Image(HPKxhomHP, Image(HKxhomHPKx, x))
            );
          HKhomHKx := GroupHomomorphismByImagesNC(
              HK, HKx, GeneratorsOfGroup(HK), GeneratorsOfGroup(HKx)
            );
          HKhomHP2 := GroupHomomorphismByFunction(
              HK, HP, a -> Image(HKxhomHP, Image(HKhomHKx, a))
            );
          for x in GeneratorsOfGroup(HK) do
            Append(HPrels, [Image(HKhomHP, x) * Image(HKhomHP2, x) ^ -1]);
          od;
        od;
      fi;
    fi;
  od;
  f := NormalClosure(HP, Group(SSortedList(HPrels)));
  return NaturalHomomorphismByNormalSubgroup(HP, f);
end;
function(index)
  local edge, S, T, id, m, sign;
  if index = [] then
    return [];
  fi;
  S := [[0, -1], [1, 0]];
  T := [[1, 1], [0, 1]];
  id := [[1, 0], [0, 1]];
  if index = [1] then
    return id;
  fi;
  if index = [0] then
    return id;
  fi;
  if index = [-1] then
    return T ^ -1;
  fi;
  if index[1] = 0 then
    Remove(index, 1);
  fi;
  if (Length(index) mod 2) = 1 then
    sign := index[1];
    index[1] := index[1] - SignInt(index[1]);
    edge := T ^ SignInt(sign) * EdgeFinder(index);
  else
    Remove(index, 1);
    edge := S * EdgeFinder(index);
  fi;
  return edge;
end;
function(arg)
  local G, morph, N, s, p, e, i, j, k, ise, fine, cor;
  G := arg[1];
  morph := arg[2];
  fine := false;
  if Length(arg) > 2 then
    N := arg[3];
    e := [G, N];
    if Length(arg) > 3 then
      fine := arg[4];
    fi;
    if fine then
      e := ElementaryAbelianSeries(e);
    else
      e := ElementaryAbelianSeriesLargeSteps(e);
    fi;
  else
    N := TrivialSubgroup(G);
    e := DerivedSeriesOfGroup(G);
    e := ElementaryAbelianSeriesLargeSteps(e);
  fi;
  s := [G];
  i := 2;
  while i <= Length(e) do
    ise := [e[i]];
    cor := e[i];
    for j in ise do
      for k in morph do
        p := Image(k, j);
        if not IsSubset(p, cor) then
          Add(ise, p);
          cor := Intersection(cor, p);
        fi;
      od;
    od;
    Assert(1, HasElementaryAbelianFactorGroup(s[Length(s)], cor));
    ise := cor;
    Add(s, ise);
    p := Position(e, ise);
    if p <> fail then
      i := p + 1;
    elif fine then
      e := ElementaryAbelianSeries([G, ise, TrivialSubgroup(G)]);
      i := Position(e, ise) + 1;
    else
      e := ElementaryAbelianSeriesLargeSteps([G, ise, TrivialSubgroup(G)]);
      i := Position(e, ise) + 1;
    fi;
    Assert(1, ise in e);
  od;
  return s;
end;
function(W)
  local L, F, H;
  L := CriticalCells(W);
  if [0, 2] = SortedList(List(L, x -> x[1])) then
    return true;
  fi;
  H := List([0 .. 3], i -> Homology(W, i));
  if not H = [[0], [], [], [0]] then
    return false;
  fi;
  F := FundamentalGroup(W);
  if GeneratorsOfGroup(F) = [] then
    return true;
  fi;
  if Order(F) = 1 then
    return true;
  fi;
  return false;
end;
function(enum)
  if IsBound(enum!.AsList) then
    return enum!.AsList(enum);
  else
    return ConstantTimeAccessList(enum);
  fi;
end;
