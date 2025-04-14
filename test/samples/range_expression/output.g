[1 .. Length(indcopy) - 1];
[0 .. i - 1];
[1 .. n];
[1 .. n];
[1 .. n];
[1 .. rank];
[1 .. n];
[1 .. v];
[1 .. Maximum(alphabet)];
[1 .. n];
[1 .. l];
[1 .. g];
[1 .. j - 1];
[1 .. 10];
[1 .. Length(QSd.Weights)];
[1 .. l];
[1 .. Length(reps)];
[1 .. nccl];
[1 .. Length(rels2)];
[1 .. n];
[cg.commutator + 1 .. cg.commutator + cg.centralizer];
[t.dynamic.topleft[2] + (t.dynamic.topleft[2] mod 2) .. selected[2] - 1];
[minMiddleLength, minMiddleLength + granularity + 2 .. maxMiddleLength];
[1 .. Position(LGFirst(spg), head)];
[2 .. Length(M0.labels) - Length(M1.labels) + 1];
[2 .. Length(libtbl.construction)];
[2 .. Length(S.labels) - Length(N!.stabChain.labels) + Length(N) + 1];
[t.dynamic.topleft[2] + (t.dynamic.topleft[2] mod 2) .. selected[2] - 1];
[pos[j] + 1 .. Length(words[part[j]])];
[Position(spinsymname, '(') + 1 .. Length(spinsymname) - 1];
[N!.subspace.dimensionN + 1 .. N!.subspace.dimensionN + N!.subspace.dimensionC];
[pos + 2 .. Length(entry)];
[Position(comment, ':') + 2 .. Length(comment)];
[84 .. Maximum(bcr)];
[re.dimssubs[j] + 1 .. re.dimssubs[j] + re.dimsfacts[j]];
[
  1 ..
  Minimum(
    DegreeOfUnivariateLaurentPolynomial(pol),
    Random([2, 2, 2, 2, 3, 3, 3, 4, 5, 6])
  )
];
[2 ^ (k - 1) - 2 ^ ((k + 1) / 2) / 2 .. 2 ^ (k - 1) - 2 ^ (QuoInt(k, 2) - 1)];
[
  1 ..
  Length(
    Defs{Filtered([1 .. Length(Defs)], x -> weights[x] < Maximum(weights))}
  )
];
[lbracket + 1 .. rbracket - 1];
[
  PositionSublist(initmessage, "scscp_versions=") + 16 ..
  PositionSublist(initmessage, "\" ?>") - 1
];
