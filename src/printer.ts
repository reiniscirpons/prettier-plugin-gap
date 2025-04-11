import { Doc, doc, AstPath, ParserOptions } from "prettier";
import { SyntaxNode } from "tree-sitter";
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
  path: AstPath,
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
        node.firstChild.type == "not",
      );
    case "call":
      return path.map(print, "children");
    case "argument_list":
      return printArgumentExpression(
        path.map(print, "children"),
        node.children.findIndex((child: SyntaxNode) => child.type == ":"),
      );
    case "binary_expression":
      return printBinaryExpression(
        path.map(print, "children"),
        findFieldIndex(node, "operator"),
      );
    case "parenthesized_expression":
      return printListExpression(path.map(print, "children"), false);
    case "assignment_statement":
      return printAssignmentStatement(
        path.map(print, "children"),
        node.children.findIndex((child: SyntaxNode) => child.type == ":="),
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
          .slice(0, findFieldIndex(node, "selector"))
          .findLastIndex((child: SyntaxNode) => child.type == "["),
      );
    case "if_statement":
      const condition_index_1 = findFieldLastIndex(node, "condition");
      return printIfStatement(
        path.map(print, "children"),
        // First "then" before body
        condition_index_1 +
        node.children
          .slice(condition_index_1)
          .findIndex((child: SyntaxNode) => child.type == "then"),
      );
    case "elif_clause":
      const condition_index_2 = findFieldLastIndex(node, "condition");
      return printElifClause(
        path.map(print, "children"),
        // First "then" before body
        condition_index_2 +
        node.children
          .slice(condition_index_2)
          .findIndex((child: SyntaxNode) => child.type == "then"),
      );
    case "else_clause":
      return printElseClause(path.map(print, "children"));
    case "return_statement":
      return printReturnStatement(path.map(print, "children"));
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

function findFieldIndex(node: SyntaxNode, field_name: string): number {
  const field_child = node.childForFieldName(field_name);
  if (field_child == null) {
    return -1;
  }
  return node.children.findIndex(
    (child: SyntaxNode) => child.id == field_child.id,
  );
}

function findFieldLastIndex(node: SyntaxNode, field_name: string): number {
  const field_child = node.childForFieldName(field_name);
  if (field_child == null) {
    return -1;
  }
  return node.children.findLastIndex(
    (child: SyntaxNode) => child.id == field_child.id,
  );
}

function removeGapLineContinuation(text: string): string {
  return text.replaceAll("\\\n", "");
}

function isSimpleList(node: SyntaxNode): boolean {
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

function printArgumentExpression(
  child_docs: Doc[],
  colon_position?: number,
): Doc {
  if (colon_position == null || colon_position == -1) {
    return printListExpression(child_docs, false);
  }
  return group([
    child_docs[0],
    indent([
      softline,
      group(child_docs.slice(1, colon_position)),
      child_docs[colon_position],
      indent([softline, group(child_docs.slice(colon_position + 1, -1))]),
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
    child_docs.slice(operator_position + 1),
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

function printReturnStatement(child_docs: Doc[]): Doc {
  return [child_docs[0], " ", group(child_docs.slice(1))];
}
