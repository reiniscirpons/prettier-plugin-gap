r -> ImageElm(act, r);
x -> not x in rep.setup.coordmap;
map -> NecessarilyDifferentPermChars(map, factfus, derpos);
x -> x * (2 ^ 20, 2 ^ 20 + 1) * (2 ^ 20, 2 ^ 20 + 1);
i -> [i[1]];
p -> p in aslist;
x -> VectorSpaceToElement(pg, x);
x -> valschi[x] * valspsi[x];
x -> List(ns, y -> ExponentsConjugateLayer(ns, y, x) * one);
obj -> WindowId(obj!.sheet);
_ -> 0;
coll -> One(Representative(coll));
g -> ImageElm(isoR, ImageElm(t, g));
r -> ();
x -> Length(MinimalGeneratingSet(x));
x -> [AbsInt(x[1]), x[2]];
x -> ImageElm(hom2, x);
attr -> IsIdenticalObj(getter, attr[3]);
x -> List(x, y -> y);
p -> not PowerMap(iso, p) in PossiblePowerMaps(iso, p);
b -> b[1] = block_row and b[2] = block_col;
x -> PositionProperty(
    result, y -> TransformingPermutationsCharacterTables(x, y) <> fail
  );
x -> x[1] = std and x[2] = factgapname and x[4] = true;
x -> LieCoboundaryOperator(x);
t -> move(t, 0, -2) and BrowseData.actions.ScrollSelectedCellUp.action(t);
x -> ExponentsOfPcElement(pcgssys.pcgs, x ^ aij, [start .. next - 1]);
x -> Objectify(FamilyObj(x)!.defaultType, [ZeroCoefficient(x), []]);
p -> ForAll(orders{filt}, x -> x mod p = 0) and
  ForAny(orders{other}, x -> x mod p <> 0);
map -> InducedClassFunctionsByFusionMap(
    tableU, table2B, [TrivialCharacter(tableU)], map
  )[1];
{filt, G} -> SpecialOrthogonalGroupCons(
    filt,
    QuadraticFormByMatrix(
      InvariantQuadraticForm(G).matrix, FieldOfMatrixGroup(G)
    )
  );
x -> not x.isRejectedCategory and not x.isUnderCollapsedCategory;
i -> (-1) ^ i * Binomial(k - 1, i) * (k - i) ^ ((n - k) * (n - k + 1) / 2);
line -> Length(line) >= Length(string) and line{[1 .. Length(string)]} = string;
l -> Length(l) = 1 and LibInfoCharacterTable(l[1]).firstName <> l[1];
iter -> rec(orb := StructuralCopy(iter!.orb), new := ShallowCopy(iter!.new));
j -> ImageSetOfTransformation(j, 4) =
  ImageSetOfTransformation(Representative(i), 4) and
  KernelOfTransformation(j, 4) = KernelOfTransformation(Representative(i), 4);
i -> List(mpols.polynomials[i], p -> Value(p, [y], [1]));
x -> (a * c[d - I[x] + 1] ^ qq / c[I[x] + 1]);
{filt, params} -> InverseSemigroup(
    List([1 .. params[1]], i -> RandomBlockBijection(params[2]))
  );
p -> Index(G, SubgroupNC(G, List(GeneratorsOfGroup(G), g -> g ^ p))) = p;
