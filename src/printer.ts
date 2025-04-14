import { Doc, doc, AstPath, ParserOptions } from "prettier";
import { GapNode } from "./parser";
const {
  join,
  line,
  softline,
  hardline,
  indent,
  dedent,
  fill,
  group,
  literalline,
} = doc.builders;

export type PrintFn = (path: AstPath) => Doc;

// Graham
// Parsing grammar

export function print(
  path: AstPath<GapNode>,
  options: ParserOptions,
  print: PrintFn,
): Doc {
  const node = path.node;
  // console.log(node.type);
  switch (node.type) {
    case "source_file":
      return group(addSemicolonSeparators(path.map(print, "children"), true), {
        shouldBreak: true,
      });
    case ",":
      if (node.nextSibling === null || node.nextSibling.type == ",")
        return [","];
      return [",", line];
    case ".":
      return [softline, "."];
    case "!.":
      return [softline, "!."];
    case "integer":
      return printInteger(node.text, options.printWidth);
    case "identifier":
      return printIdentifier(node.text);
    case "list_expression":
      return printListExpression(
        path.map(print, "children"),
        isSimpleList(node),
      );
    case "unary_expression":
      return printUnaryExpression(
        path.map(print, "children"),
        node.firstChild != null && node.firstChild.type == "not",
      );
    case "call":
      return path.map(print, "children");
    case "argument_list":
      return printArgumentList(
        path.map(print, "children"),
        node.findChildIndexByType(":"),
      );
    case "binary_expression":
      return printBinaryExpression(
        path.map(print, "children"),
        node.findChildIndexByField("operator"),
      );
    case "parenthesized_expression":
      return printListExpression(path.map(print, "children"), false);
    case "assignment_statement":
      return printAssignmentStatement(
        path.map(print, "children"),
        node.children.findIndex((child: GapNode) => child.type == ":="),
      );
    case "record_entry":
      return printAssignmentStatement(
        path.map(print, "children"),
        node.children.findIndex((child: GapNode) => child.type == ":="),
      );
    case "string":
      return node.text;
    case "permutation_cycle_expression":
      // TODO: Maybe print this slightly differently?
      return printListExpression(path.map(print, "children"), true);
    case "permutation_expression":
      return fill(join(softline, path.map(print, "children")));
    case "list_selector":
      return printListSelector(
        path.map(print, "children"),
        // First "[" before selector
        node.children
          .slice(0, node.findChildIndexByField("selector"))
          .findLastIndex((child: GapNode) => child.type == "["),
      );
    case "sublist_selector":
      return printListSelector(
        path.map(print, "children"),
        // First "{" before selector
        node.children
          .slice(0, node.findChildIndexByField("selector"))
          .findLastIndex((child: GapNode) => child.type == "{"),
      );
    case "positional_selector":
      return printListSelector(
        path.map(print, "children"),
        // First "![" before selector
        node.children
          .slice(0, node.findChildIndexByField("selector"))
          .findLastIndex((child: GapNode) => child.type == "!["),
      );
    case "if_statement":
      const condition_index_1 = node.findChildLastIndexByField("condition");
      return printIfStatement(
        path.map(print, "children"),
        // First "then" before body
        condition_index_1 +
          node.children
            .slice(condition_index_1)
            .findIndex((child: GapNode) => child.type == "then"),
      );
    case "elif_clause":
      const condition_index_2 = node.findChildLastIndexByField("condition");
      return printElifClause(
        path.map(print, "children"),
        // First "then" before body
        condition_index_2 +
          node.children
            .slice(condition_index_2)
            .findIndex((child: GapNode) => child.type == "then"),
      );
    case "else_clause":
      return printElseClause(path.map(print, "children"));
    case "return_statement":
      return printReturnStatement(path.map(print, "children"));
    case "bool":
      return node.text;
    case "record_selector":
      return printRecordSelector(
        path.map(print, "recordAndComponentSelectorChain"),
      );
    case "component_selector":
      return printRecordSelector(
        path.map(print, "recordAndComponentSelectorChain"),
      );
    case "record_expression":
      return printRecordExpression(
        path.map(print, "children"),
        node.children[node.children.length - 2].type == ",",
      );
    case "function_call_option":
      return path.map(print, "children");
    case "function_expression":
      return printFunctionExpression(path.map(print, "children"));
    case "parameters":
      return printListExpression(path.map(print, "children"), false);
    case "locals":
      return printLocals(path.map(print, "children"));
    case "pragma":
      return [node.text, hardline];
    case "lambda":
      return printLambda(path.map(print, "children"));
    case "lambda_parameters":
      return printLambdaParameters(
        path.map(print, "children"),
        node.children.length == 1 &&
          node.firstChild != null &&
          node.firstChild.type == "identifier",
      );
    case "range_expression":
      return printRangeExpression(
        path.map(print, "children"),
        node.children
          .slice(0, node.findChildIndexByField("last"))
          .findLastIndex((child: GapNode) => child.type == ".."),
      );
    case "for_statement":
      return printForStatement(
        path.map(print, "children"),
        node.children
          .slice(0, node.findChildIndexByField("values"))
          .findLastIndex((child: GapNode) => child.type == "in"),
        node.children
          .slice(0, node.findChildIndexByField("body"))
          .findLastIndex((child: GapNode) => child.type == "do"),
      );
    case "escape_sequence":
      return node.text;
    case "while_statement":
      return printWhileStatement(
        path.map(print, "children"),
        node.children
          .slice(0, node.findChildIndexByField("body"))
          .findLastIndex((child: GapNode) => child.type == "do"),
      );
    case "repeat_statement":
      return printRepeatStatement(
        path.map(print, "children"),
        node.children
          .slice(0, node.findChildIndexByField("condition"))
          .findLastIndex((child: GapNode) => child.type == "until"),
      );
  }
  return node.text;
}

function addSemicolonSeparators(docs: Doc[], include_last: boolean): Doc[] {
  const last_semicolon_index = docs.findLastIndex((doc: Doc) => doc == ";");
  if (last_semicolon_index == -1) {
    return docs;
  }
  return docs.map((doc: Doc, index: number) =>
    doc == ";" && (include_last || index != last_semicolon_index)
      ? [";", hardline]
      : doc,
  );
}

function removeGapLineContinuation(text: string): string {
  return text.replaceAll("\\\n", "");
}

function isSimpleList(node: GapNode): boolean {
  for (const child of node.children) {
    if (child.type == "list_expression") {
      return false;
    }
  }
  return true;
}

function printInteger(text: string, printWidth: number): Doc {
  const joined_text = removeGapLineContinuation(text);
  if (joined_text.length < printWidth) {
    return joined_text;
  }
  const parts = [];
  for (let i = 0; i < joined_text.length; i += printWidth - 1) {
    const substring = joined_text.substring(i, i + printWidth - 1);
    if (i + printWidth - 1 < joined_text.length) {
      parts.push(substring + "\\");
    } else {
      parts.push(substring);
    }
  }
  return group(join(literalline, parts), { shouldBreak: true });
}

function printIdentifier(text: string): Doc {
  return removeGapLineContinuation(text);
}

function printListExpression(child_docs: Doc[], is_simple: boolean): Doc {
  // assumes child_docs.length >= 2
  if (is_simple) {
    // For some bizarre reason indent only indents after first newline, dont ask
    return group([
      child_docs[0],
      indent([softline, fill(child_docs.slice(1, -1))]),
      softline,
      child_docs[child_docs.length - 1],
    ]);
  }
  return group([
    child_docs[0],
    indent([softline, group(child_docs.slice(1, -1))]),
    softline,
    child_docs[child_docs.length - 1],
  ]);
}

function printArgumentList(child_docs: Doc[], colon_position?: number): Doc {
  if (colon_position == null || colon_position == -1) {
    return printListExpression(child_docs, false);
  }
  return group([
    child_docs[0],
    indent([
      softline,
      group(child_docs.slice(1, colon_position)),
      child_docs[colon_position],
      indent([line, group(child_docs.slice(colon_position + 1, -1))]),
    ]),
    softline,
    child_docs[child_docs.length - 1],
  ]);
}

function printUnaryExpression(child_docs: Doc[], separate: boolean): Doc {
  if (separate) {
    return group([child_docs[0], " ", child_docs.slice(1)]);
  }
  return child_docs;
}

function printBinaryExpression(
  child_docs: Doc[],
  operator_position: number,
): Doc {
  if (operator_position == -1) {
    throw new Error("Wrong operator index specified in binary expression!");
  }
  return fill([
    child_docs.slice(0, operator_position),
    " ",
    child_docs[operator_position],
    line,
    child_docs.slice(operator_position + 1),
  ]);
}

function printAssignmentStatement(
  child_docs: Doc[],
  operator_position: number,
): Doc {
  if (operator_position == -1) {
    throw new Error("Wrong operator index specified in binary expression!");
  }
  return group([
    child_docs.slice(0, operator_position),
    " ",
    child_docs[operator_position],
    " ",
    indent(child_docs.slice(operator_position + 1)),
  ]);
}

function printListSelector(
  child_docs: Doc[],
  opening_bracket_position: number,
): Doc {
  if (opening_bracket_position == -1) {
    throw new Error("Wrong opening bracket index specified in list selector!");
  }
  return [
    child_docs.slice(0, opening_bracket_position),
    printListExpression(child_docs.slice(opening_bracket_position), false),
  ];
}

function printIfStatement(child_docs: Doc[], then_position: number): Doc {
  if (then_position == -1) {
    throw new Error("Wrong then position in if statement!");
  }
  return group(
    [
      child_docs[0],
      " ",
      indent(
        indent([
          group([
            child_docs.slice(1, then_position),
            " ",
            child_docs[then_position],
          ]),
        ]),
      ),
      indent(
        group(
          [
            hardline,
            addSemicolonSeparators(
              child_docs.slice(then_position + 1, -1),
              false,
            ),
          ],
          {
            shouldBreak: true,
          },
        ),
      ),
      hardline,
      child_docs[child_docs.length - 1],
    ],
    { shouldBreak: true },
  );
}

function printElifClause(child_docs: Doc[], then_position: number): Doc {
  if (then_position == -1) {
    throw new Error("Wrong then position in if statement!");
  }
  return dedent(
    group(
      [
        hardline,
        child_docs[0],
        " ",
        indent(
          indent([
            group([
              child_docs.slice(1, then_position),
              " ",
              child_docs[then_position],
            ]),
          ]),
        ),
        indent(
          group(
            [
              hardline,
              addSemicolonSeparators(
                child_docs.slice(then_position + 1),
                false,
              ),
            ],
            {
              shouldBreak: true,
            },
          ),
        ),
      ],
      { shouldBreak: true },
    ),
  );
}

function printElseClause(child_docs: Doc[]): Doc {
  return dedent(
    group(
      [
        hardline,
        child_docs[0],
        indent(
          group(
            [hardline, addSemicolonSeparators(child_docs.slice(1), false)],
            { shouldBreak: true },
          ),
        ),
      ],
      { shouldBreak: true },
    ),
  );
}

function printReturnStatement(child_docs: Doc[]): Doc {
  if (child_docs.length == 1) {
    return child_docs;
  }
  return [child_docs[0], " ", group(child_docs.slice(1))];
}

function printRecordSelector(child_docs: Doc[]): Doc {
  return [child_docs[0], indent(group(child_docs.slice(1)))];
}

function printRecordExpression(
  child_docs: Doc[],
  has_trailing_comma: boolean,
): Doc {
  return group(
    [
      child_docs[0],
      child_docs[1],
      indent([
        softline,
        group(child_docs.slice(2, has_trailing_comma ? -2 : -1), {
          shouldBreak: has_trailing_comma,
        }),
      ]),
      has_trailing_comma ? [",", softline] : softline,
      child_docs[child_docs.length - 1],
    ],
    { shouldBreak: has_trailing_comma },
  );
}

function printFunctionExpression(child_docs: Doc[]): Doc {
  return group(
    [
      child_docs[0],
      child_docs[1],
      indent(
        group(
          [hardline, addSemicolonSeparators(child_docs.slice(2, -1), false)],
          {
            shouldBreak: true,
          },
        ),
      ),
      hardline,
      child_docs[child_docs.length - 1],
    ],
    { shouldBreak: true },
  );
}

function printLocals(child_docs: Doc[]): Doc {
  let rest: Doc = [line];
  rest = rest.concat(child_docs.slice(1));
  return [child_docs[0], indent(fill(rest))];
}

function printLambda(child_docs: Doc[]): Doc {
  return group([
    child_docs[0],
    " ",
    child_docs[1],
    " ",
    indent(group(child_docs.slice(2))),
  ]);
}

function printLambdaParameters(child_docs: Doc[], is_identifier: boolean): Doc {
  if (is_identifier) {
    return child_docs;
  }
  return printListExpression(child_docs, false);
}

function printRangeExpression(child_docs: Doc[], dotdot_position: number): Doc {
  if (dotdot_position == -1) {
    throw new Error("Wrong .. position in range expression!");
  }
  return group([
    child_docs[0],
    indent(
      group([
        softline,
        child_docs.slice(1, dotdot_position),
        " ",
        child_docs[dotdot_position],
        line,
        child_docs.slice(dotdot_position + 1, -1),
      ]),
    ),
    softline,
    child_docs[child_docs.length - 1],
  ]);
}

function printForStatement(
  child_docs: Doc[],
  in_position: number,
  do_position: number,
): Doc {
  if (in_position == -1) {
    throw new Error("Wrong in position in for statement!");
  }
  if (do_position == -1) {
    throw new Error("Wrong do position in for statement!");
  }
  if (in_position >= do_position) {
    throw new Error("Do before in in for statement!");
  }
  if (in_position == do_position - 1) {
    throw new Error("No values field in for statement!");
  }
  return group(
    [
      child_docs[0],
      " ",
      indent(
        indent([
          group([
            child_docs.slice(1, in_position),
            " ",
            child_docs[in_position],
            line,
            child_docs.slice(in_position + 1, do_position),
            " ",
            child_docs[do_position],
          ]),
        ]),
      ),
      indent(
        group(
          [
            hardline,
            addSemicolonSeparators(
              child_docs.slice(do_position + 1, -1),
              false,
            ),
          ],
          {
            shouldBreak: true,
          },
        ),
      ),
      hardline,
      child_docs[child_docs.length - 1],
    ],
    { shouldBreak: true },
  );
}

function printWhileStatement(child_docs: Doc[], do_position: number): Doc {
  if (do_position == -1) {
    throw new Error("Wrong do position in for statement!");
  }
  return group(
    [
      child_docs[0],
      " ",
      indent(
        indent([
          group([
            child_docs.slice(1, do_position),
            " ",
            child_docs[do_position],
          ]),
        ]),
      ),
      indent(
        group(
          [
            hardline,
            addSemicolonSeparators(
              child_docs.slice(do_position + 1, -1),
              false,
            ),
          ],
          {
            shouldBreak: true,
          },
        ),
      ),
      hardline,
      child_docs[child_docs.length - 1],
    ],
    { shouldBreak: true },
  );
}

function printRepeatStatement(child_docs: Doc[], until_position: number): Doc {
  if (until_position == -1) {
    throw new Error("Wrong until position in repeat statement!");
  }
  return group(
    [
      child_docs[0],
      indent(
        group(
          [
            hardline,
            addSemicolonSeparators(child_docs.slice(1, until_position), false),
          ],
          {
            shouldBreak: true,
          },
        ),
      ),
      hardline,
      child_docs[until_position],
      indent(group([line, child_docs.slice(until_position + 1)])),
    ],
    { shouldBreak: true },
  );
}
