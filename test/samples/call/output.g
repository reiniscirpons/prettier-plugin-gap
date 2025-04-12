Source(x);
IsRay(cone);
SpaceGroupOnLeftIT(3, 222);
PrimeDivisors(Size(G));
ForAllOp(l![1], p);
FamilyObj(t);
Matrix(UU);
SetInfoLevel(InfoIdRel, saved_infolevel_idrel);
Recolor(latt, C, COLORS.green);
DimensionOfMatrixGroup(gl);
FamilyObj(a);
ParentAttr(U);
Filtered(heads, x -> x <> 0);
QUEAToUEAMap(L);
EC(19);
Basis(V);
Append(critical, tmp[2]);
Concatenation("Aut(", Name(pj), ")");
LeftActingDomain(Cold);
FindBasePointCandidates(
  Group(lgens), opt, ii, false:
    Subrecurse := recsub, Facrecurse := recfac
);
Print(
  "#E  ", p, "-modular table of '", Identifier(ordtblMGA), "' is missing\n"
);
IsGeneratorsOfSemigroup(Concatenation(GeneratorsOfSemigroup(S), coll));
DeclareOperation(
  "LeadingTermOfPolynomial", [IsPolynomialFunction, IsMonomialOrdering]
);
DeclareOperation(
  "LeadingTermOfPolynomial",
  [IsPolynomialFunction, IsMonomialOrdering, IsObject, IsObject]
);
DeclareOperation(
  "LeadingTermOfPolynomial",
  [
    IsPolynomialFunction, IsMonomialOrdering, IsObject, IsObject, IsObject,
    IsObject, IsObject
  ]
);
SET_CONWAYPOLDATA(41609, [,,, [7846708441, "JB"], ]);
AsCapCategoryMorphism(
  OppositeCategory(cat_1),
  CAP_JIT_INCOMPLETE_LOGIC(Opposite(CAP_JIT_INCOMPLETE_LOGIC(deduped_3_1))),
  UnionOfColumns(
    deduped_4_1,
    deduped_1_1,
    [
      HomalgZeroMatrix(
        deduped_1_1, Sum(deduped_2_1{[1 .. k_1 - 1]}), deduped_4_1
      ),
      HomalgIdentityMatrix(deduped_1_1, deduped_4_1),
      HomalgZeroMatrix(
        deduped_1_1,
        Sum(deduped_2_1{[k_1 + 1 .. Length(objects_1)]}),
        deduped_4_1
      )
    ]
  ),
  Opposite(P_1)
);
CreateCapCategoryMorphismWithAttributes(
  cat_1,
  P_1,
  deduped_3_1,
  Opposite,
  AsCapCategoryMorphism(
    OppositeCategory(cat_1),
    CAP_JIT_INCOMPLETE_LOGIC(Opposite(CAP_JIT_INCOMPLETE_LOGIC(deduped_3_1))),
    UnionOfColumns(
      deduped_4_1,
      deduped_1_1,
      [
        HomalgZeroMatrix(
          deduped_1_1, Sum(deduped_2_1{[1 .. k_1 - 1]}), deduped_4_1
        ),
        HomalgIdentityMatrix(deduped_1_1, deduped_4_1),
        HomalgZeroMatrix(
          deduped_1_1,
          Sum(deduped_2_1{[k_1 + 1 .. Length(objects_1)]}),
          deduped_4_1
        )
      ]
    ),
    Opposite(P_1)
  )
);
CreateCapCategoryMorphismWithAttributes(
  cat_1,
  deduped_3_1,
  P_1,
  Opposite,
  AsCapCategoryMorphism(
    OppositeCategory(cat_1),
    Opposite(P_1),
    UnionOfRows(
      deduped_4_1,
      deduped_1_1,
      [
        HomalgZeroMatrix(
          Sum(deduped_2_1{[1 .. k_1 - 1]}), deduped_1_1, deduped_4_1
        ),
        HomalgIdentityMatrix(deduped_1_1, deduped_4_1),
        HomalgZeroMatrix(
          Sum(deduped_2_1{[k_1 + 1 .. Length(objects_1)]}),
          deduped_1_1,
          deduped_4_1
        )
      ]
    ),
    CAP_JIT_INCOMPLETE_LOGIC(Opposite(CAP_JIT_INCOMPLETE_LOGIC(deduped_3_1)))
  )
);
Automaton(
  "det",
  5,
  "abcdefghijklmnopqrst",
  [
    [0, 1, 2, 3, 0],
    [2, 4, 5, 0, 0],
    [0, 1, 3, 4, 0],
    [1, 2, 4, 0, 0],
    [1, 3, 4, 0, 0],
    [0, 1, 2, 5, 0],
    [0, 1, 2, 5, 0],
    [0, 3, 5, 0, 0],
    [0, 1, 2, 4, 0],
    [1, 2, 4, 0, 0],
    [0, 1, 5, 0, 0],
    [1, 4, 5, 0, 0],
    [2, 4, 5, 0, 0],
    [0, 1, 2, 4, 5],
    [0, 2, 0, 0, 0],
    [2, 3, 5, 0, 0],
    [1, 2, 3, 4, 0],
    [0, 2, 4, 5, 0],
    [1, 2, 3, 5, 0],
    [0, 1, 5, 0, 0]
  ],
  [5],
  [1, 3, 4, 5]
);
EvaluateBySCSCP("SylowSubgroup", [M24, 2], laptop, port: output := "cookie");
