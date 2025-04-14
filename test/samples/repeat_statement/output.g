repeat
  d := NextIterator(iter);
until Size(d) > 1;
repeat

until fertig or procrels();
repeat
  r := NextIterator(iter);
until Size(r) > 1;
repeat
  d := NextIterator(iter);
until Size(d) > 1;
repeat
  x := PseudoRandom(der);
until Order(x) = 40;
repeat
  g5 := Random(zenp);
until Group([g4, g5]) = zenp;
repeat
  g := Random(P);
until Order(g) = p ^ 2 and g ^ p in Centre(P);
repeat
  c := Random(P);
until not c in Centre(P) and d * c = c * d;
repeat

until ReadAll(stream) = fail;
repeat
  d := NextIterator(iter);
until Size(d) > 1;
repeat
  t := Random(G);
until not t in Zn;
repeat
  r := NextIterator(iter);
until Size(r) > 1;
repeat
  s := Random(g3);
until Order(s) = 15;
repeat
  h := Random(P);
until not h in Zen and pcgsq[1] ^ h = pcgsq[1] and Order(h) = p ^ 2;
repeat
  g := Random(P);
until Order(g) = p and not g in FrattiniSubgroup(P);
repeat

until true;
repeat
  g1 := Random(P);
until
  pcgsq[1] ^ g1 <> pcgsq[1] and Order(g1) = p and
  g4 ^ g1 = g4 * g2 ^ (Int(a) * p);
repeat
  g := Random(P);
until pcgsq[1] ^ g <> pcgsq[1] and h ^ g <> h ^ (p + 1);
repeat
  g2 := Random(P);
until not g2 in dP and g ^ g2 <> g;
repeat
  x := Random(g2);
until Order(x) = 14;
repeat
  x := Random(g);
until Order(x) = 15 and mp - NrMovedPoints(x ^ 5) = 135;
repeat
  r := qr[1];
  qr := QuotientRemainder(Integers, r, p);
until qr[2] <> 0;
repeat
  if imgs = false then
    e := SCRingElmSift(moduli, l, pivots, e, 0);
    ei := 0;
  else
    e := SCRingElmSiftImages(moduli, l, imgs, pivots, e, ei);
    ei := e[2];
    e := e[1];
  fi;
  p := -1;
  f := 1;
  for j in [1 .. Length(moduli)] do
    if e[j] <> 0 then
      g := moduli[j] / Gcd(moduli[j], e[j]);
      if g > f then
        f := g;
        p := j;
      fi;
    fi;
  od;
  if p > 0 and IsBound(pivots[p]) then
    j := pivots[p];
    f := l[j];
    if imgs <> false then
      fj := imgs[j];
    else
      fj := 0;
    fi;
    repeat
      g := f;
      f := e;
      q := QuoInt(g[p], f[p]);
      e := g - q * f;
      if imgs <> false then
        gj := fj;
        fj := ei;
        ei := gj - q * fj;
      fi;
      e := SCRingReducedModuli(moduli, e);
    until e[p] = 0;
    if f[p] < 0 then
      f := -f;
      fj := -fj;
    fi;
    for k in [p + 1 .. Length(moduli)] do
      if IsBound(pivots[k]) then
        q := QuoInt(f[k], l[pivots[k]][k]);
        f := SCRingReducedModuli(moduli, f - q * l[pivots[k]]);
        if imgs <> false then
          fj := fj - q * imgs[pivots[k]];
        fi;
      fi;
    od;
    l[j] := f;
    if imgs <> false then
      imgs[j] := f;
    fi;
    for i in [1 .. j - 1] do
      for k in [p .. Length(moduli)] do
        if IsBound(pivots[k]) then
          q := QuoInt(l[i][k], l[pivots[k]][k]);
          l[i] := SCRingReducedModuli(moduli, l[i] - q * l[pivots[k]]);
          if imgs <> false then
            imgs[i] := imgs[i] - q * imgs[pivots[k]];
          fi;
        fi;
      od;
    od;
  fi;
until IsZero(e) or not IsBound(pivots[p]);
repeat
  stdgens := BBStdGenFinder.(name)(Gm);
until stdgens <> fail;
repeat
  i := i + 1;
  y := elmts[i];
  if x ^ 2 + y ^ 2 = -Z(q) ^ 0 then
    mark := true;
  fi;
until mark or i = q;
repeat
  x := NextIterator(baseiter);
until IsDoneIterator(baseiter) or iter!.isnew(iter, x);
repeat
  repeat
    p := NextPrimeInt(p);
  until not IsInt(d / p);
  pm := PolynomialModP(f, p);
until
  DegreeOfUnivariateLaurentPolynomial(pm) =
  DegreeOfUnivariateLaurentPolynomial(f);
repeat
  i := 1;
  ap := 1;
  while ap <= Length(w) do
    a := w[ap];
    if ct[a + offset][i] = 0 then
      dr := NEWTC_Define(DATA, i, a);
      if dr = fail then
        return fail;
      fi;
      NEWTC_ProcessDeductions(DATA);
      ap := Length(w) + 10;
    fi;
    i := ct[a + offset][i];
    ap := ap + 1;
  od;
until ap = Length(w) + 1;
repeat
  while p <= Length(cl) and b[p] do
    p := p + 1;
  od;
  if p <= Length(cl) then
    b[p] := true;
    Add(rep, p);
    cls := [cl[p]];
    for i in cls do
      for g in GeneratorsOfGroup(D) do
        x := i ^ g;
        xp := PositionSorted(cl, x);
        if not b[xp] then
          Add(cls, x);
          b[xp] := true;
        fi;
      od;
    od;
  fi;
  p := p + 1;
until p > Length(cl);
repeat
  y := Next(pr);
  o := Order(y);
until o > 1;
repeat
  k := CoefficientsOfUnivariatePolynomial(f[i])[1];
until Degree(f[i]) = 1;
repeat
  Enumerate(o[i], limit);
  found := IsClosed(o[i]);
  if Length(o[i]) = 1 then
    Info(InfoGenSS, 3, "Orbit Number ", i, " has length 1.");
    found := false;
    ThrowAwayOrbit(i);
  elif not (found) then
    i := i + 1;
  fi;
  if i > nrorbs then
    Info(InfoGenSS, 3, "Done ", nrorbs, " orbit(s) to limit ", limit, ".");
    limit := limit * 2;
    if limit > opt.ShortOrbitsOrbLimit then
      Info(InfoGenSS, 3, "Limit reached, giving up.");
      return fail;
    fi;
    i := 1;
    if nrorbs < i then
      Info(InfoGenSS, 3, "No orbits left, giving up.");
      return fail;
    fi;
    if nrorbs > 1 then
      newnrorbs := QuoInt((nrorbs + 1), 2);
      for j in [newnrorbs + 1 .. nrorbs] do
        Unbind(o[j]);
      od;
      nrorbs := newnrorbs;
    fi;
  fi;
until found;
repeat
  m := m + 1;
  q := q * p;
  size2 := q ^ 3 * (q ^ 3 + 1) * (q - 1);
until size <= size2;
repeat
  r := r + 1;
  Add(B, []);
  for i in [1 .. Length(B[r])] do
    for j in [1 .. Length(coeffs)] do
      cl := B[r][i];
      inter := Filtered(
          coeffs[j], c -> (cl[1] - c[1]) mod Gcd(cl[2], c[2]) = 0
        );
      if Length(inter) > 1 and Length(Set(List(inter, c -> c{[3 .. 5]}))) > 1 then
        return fail;
      fi;
      c := inter[1];
      img := [(c[3] * cl[1] + c[4]) / c[5], c[3] * cl[2] / c[5]];
      img[1] := img[1] mod img[2];
      if img in B[r] or (r > 1 and img in B[r - 1]) then
        continue;
      fi;
      Add(B[r + 1], img);
    od;
  od;
  B[r + 1] := Immutable(Set(B[r + 1]));
  IsSSortedList(B[r + 1]);
  if Sum(List(B, Length)) > maxlng then
    return fail;
  fi;
until B[r + 1] = [];
repeat
  ev1 := ExponentsByObj(coll, [j, -1]);
until CollectWordOrFail(coll, ev1, w) <> fail;
repeat
  i := i + 1;
until IsAbelianTom(FactorGroupTom(tom, result[i]));
repeat
  ngens := ngens * 8;
  q := PQuotient(G, p, 2, ngens: noninteractive);
until q <> fail;
repeat
  e := Set(List(e, x -> x ^ p));
  o := Orbits(G, e);
  Add(s, Length(o));
until Length(e) = 1;
repeat
  resused := resused + 1;
until not resused in avoidslots;
repeat
  www := ShallowCopy(ww);
  qqq := ORB_ApplyStabElement(qq, i, i - 1, setup, tempstab, www);
  vvv := ValueHT(setup!.info[i], qqq);
  if vvv = fail then
    ret := setup!.cosetrecog[i](i, ORB_InvWord(www), setup);
    AddHT(setup!.info[i], qqq, ret);
  fi;
until Next(tempstab);
