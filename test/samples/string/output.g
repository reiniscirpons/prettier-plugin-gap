"l";
" vertices; ";
"36B";
" d=";
"5uFFDECmP5m";
"sla04.tst";
"DiagonalBlockMatrix";
"E";
"RPn";
"free";
"(p+1,3)";
"";
"doGrp.g";
"Var";
"],";
"<jupyter renderable>";
" Quotients of free group pregroup\n";
"uptowhitespace";
"incgeom_flag_chamber";
"Characteristic";
" \
[[D,0,t,0],[0,D-t,D*t,0]] \
";
"[ \
Dx, \
Dy, \
Dz  \
]";
"""
Most of the work on this package was carried out while I held a
research position at the Technische Universität Braunschweig. I
would like to express my gratitude to the staff and the students of
the Institut für Geometrie for their interest in this work. Special
thanks go to Bettina Eick for her rôle in completing this project.
""";
"This preference describes the path for calling Magma. \
An empty string (the default) means that Magma is not available.";
"[ \
x*d-3, \
d^4    \
]";
"The value must be a list of strings of the form \"<ID>|<address>\" \
where <ID> is the id of a part of the database \
and <address> is an URL or a file path \
(as an absolute path or relative to the user's home directory) of a readable \
JSON format file that contain the table of contents of this part. \
The default lists four entries: \
the core database, the data distributed with the AtlasRep package, \
and the data that belong to the packages MFER and CTBlocks.";
".|}oGCAAB`?w[OL@@P?ga@@DO`SKTDEBW_kZGDbHGw]OdQqSodEEcgw{eTcSAXOnDBRa`SrFCdrLC\
kWLEwCGz\\nFwHuO]Oqbko{bdgS\\@CcQsbyMg_QHzyEedRiYy@ChkHdAhVBMpRquK^UrSYu[cVKIi\
\\]oaGTkdCmXrsj@fPRKUbUq_VJzQ`aqZptI|fUTKejeujYLvLpWu[Mf^";
"""
                function( input_arguments... )
                    
                    return ObjectConstructor( cat, "operation_name" );
                    
                end
            """;
"""
            function ( input_arguments... )
              local dual_preprocessor_func, prep_arg, result, dual_postprocessor_func;
                
                preprocessor_string
                
                result := dual_operation_name( dual_arguments... );
                
                postprocessor_string
                
                return_statement
                
            end
            """;
"This package provides functions for computing with \
formations of finite solvable groups.";
"\n\
proc ConvertMatrixToRow (matrix m)\n\
{\n\
  int r = ncols(m);\n\
  int c = nrows(m);\n\
  matrix row[c][1] = m[1];\n\
  matrix tmp;\n\
  for (int i=2;i<=r;i++)\n\
  {\n\
    matrix tmp[i*c][1]=row,m[i];\n\
    row = tmp;\n\
  }\n\
  return(row);\n\
}\n\n";
"\n\
Eliminate := proc(L,indets::list,var::list)\n\
local IB,elim;\n\
IB := `Involutive/InvolutiveBasis`(L,[indets,remove(member,var,indets)]);\n\
elim := remove(has,IB,indets);\n\
if elim = [] then elim := matrix([[]]); fi;\n\
elim;\n\
end:\n\n";
"""
      The authors wish to thank all the comments, suggestions and issue reporting from users and developers of &GAP;, both past and future.
      Both authors were partially supported by CMUP, member of LASI, which is financed by Portuguese national funds through FCT – Fundação para a Ciência e a Tecnologia, I.P., under the project with references UIDB/00144/2020 and UIDP/00144/2020. 
      """;
"PegSolitaire( 45 );\n\
";
"""
            """;
"\n\
proc NonTrivialWeightedDegreePerRowWithColPosition(matrix M, weights)\n\
{\n\
  intmat m[2][ncols(M)];\n\
  poly e;\n\
  for (int i=1; i<=ncols(M); i++)\n\
  {\n\
    for (int j=1; j<=nrows(M); j++)\n\
    {\n\
      e = M[j,i];\n\
      if ( e <> 0 ) { m[1,i] = Deg(e,weights); m[2,i] = j; break; }\n\
    }\n\
  }\n\
  return(m);\n\
}\n\n";
"""
 Supported in Normaliz >= 3.5.0.
""";
"""
table { border-collapse: collapse }
tr:nth-child(odd)  { background-color: #EEE; }
tr:nth-child(even)  { background-color: #FFF; }
tr:nth-child(odd).exec  { background-color: #3E3; }
tr:nth-child(even).exec  { background-color: #6E6; }
tr:nth-child(odd).missed  { background-color: #F00; }
tr:nth-child(even).missed  { background-color: #F33; }
td, th {
    border: 1px solid #98bf21;
    padding: 3px 7px 2px 7px;
}
th {
    font-size: 1.1em;
    text-align: left;
    padding-top: 5px;
    padding-bottom: 4px;
    background-color: #A7C942;
    color: #ffffff;
}
table.sortable th:not(.sorttable_sorted):not(.sorttable_sorted_reverse):not(.sorttable_nosort):after {
    content: " \25B4\25BE"
}
/* HSV gradient made using http://www.perbang.dk/rgbgradient/ */
td.coverage00 { background-color: #FF0000; }
td.coverage10 { background-color: #F83100; }
td.coverage20 { background-color: #F25F00; }
td.coverage30 { background-color: #EB8B00; }
td.coverage40 { background-color: #E5B500; }
td.coverage50 { background-color: #DFDC00; }
td.coverage60 { background-color: #B0D800; }
td.coverage70 { background-color: #81D200; }
td.coverage80 { background-color: #55CB00; }
td.coverage90 { background-color: #2CC500; }
td.coverage100 { background-color: #04BF00; }""";
"\n\
BasisOfRowsCoeff = M -> (\n\
  apply(BasisOfColumnsCoeff(Involution M), Involution)\n\
);\n\n";
"[ \
x,z,0,1, 0,  \
0,0,y,-z,0,  \
0,0,x,0, -z, \
0,0,0,x, -y  \
]";
