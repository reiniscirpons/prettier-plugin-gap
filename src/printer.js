import { doc } from "prettier";
const { group, join, line, softline, indent, dedent, markAsRoot } =
  doc.builders;

function joinInbetween(sep, docs) {
  if (docs.length == 0) {
    return "";
  }
  if (docs.length == 1) {
    return docs[0];
  }

  return [join(sep, docs.slice(0, -1)), docs[docs.length - 1]];
}

function joinAfter(sep, docs) {
  if (docs.length == 0) {
    return "";
  }
  return [join(sep, docs), sep];
}

function callFieldChild(path, callback, fieldname) {
  const node = path.getValue();
  const length = path.stack.length;
  path.stack.push(node.childForFieldName(fieldname));
  const res = path.call(callback);
  path.stack.length = length;
  return res;
}

function callFieldChildren(path, callback, fieldname) {
  const node = path.getValue();
  const length = path.stack.length;
  const res = [];
  for (const child of node.childrenForFieldName(fieldname)) {
    path.stack.push(child);
    res.push(path.call(callback));
    path.stack.length = length;
  }
  return res;
}

function printIf(path, print) {
  const node = path.getValue();
  const res = [
    "if",
    " ",
    group(callFieldChild(path, print, "condition")),
    " ",
    "then",
    line,
    indent(join([";", line], callFieldChildren(path, print, "body"))),
  ];

  const length = path.stack.length;
  for (const child in node.namedChildren) {
    if (child.type == "elif_clause" || child.type == "else_clause") {
      path.stack.push(child);
      res.push(line, path.call(print));
      path.stack.length = length;
    }
  }

  res.push(line, "fi");
  return group(res, { shouldBreak: true });
}

function printSelector(path, print, left_sep, right_sep) {
  const node = path.getValue();
  return group([
    callFieldChild(path, print, "variable"),
    left_sep,
    softline,
    [callFieldChild(path, print, "selector"), right_sep],
  ]);
}

function printGap(path, options, print) {
  const node = path.getValue();

  switch (node.type) {
    case "source_file":
      return markAsRoot(
        group(joinAfter([";", line], path.map(print, "namedChildren")), {
          shouldBreak: true,
        }),
      );
    case "quit_statement":
      return node.text;
    case "assignment_statement":
      return [
        callFieldChild(path, print, "left"),
        " ",
        ":=",
        " ",
        callFieldChild(path, print, "right"),
      ];
    case "if_statement":
      return printIf(path, print);
    case "elif_clause":
      return [
        "elif",
        " ",
        group(callFieldChild(path, print, "condition")),
        " ",
        "then",
        line,
        indent(join([";", line], callFieldChildren(path, print, "body"))),
      ];
    case "else_clause":
      return [
        "else",
        line,
        indent(join([";", line], callFieldChildren(path, print, "body"))),
      ];
    case "while_statement":
      return [
        "while",
        " ",
        group(callFieldChild(path, print, "condition")),
        " ",
        "do",
        line,
        indent(join([";", line], callFieldChildren(path, print, "body"))),
        "od",
      ];
    case "repeat_statement":
      return [
        "repeat",
        line,
        indent(join([";", line], callFieldChildren(path, print, "body"))),
        "until",
        " ",
        group(callFieldChild(path, print, "condition")),
      ];
    case "for_statement":
      return [
        "for",
        " ",
        group([
          callFieldChild(path, print, "identifier"),
          " ",
          "in",
          line,
          group(callFieldChild(path, print, "values")),
        ]),
        " ",
        "do",
        line,
        indent(join([";", line], callFieldChildren(path, print, "body"))),
        "od",
      ];
    case "atomic_statement":
      return [
        "atomic",
        " ",
        group(
          join(
            [",", line],
            callFieldChildren(path, print, "qualified_expressions"),
          ),
        ),
        " ",
        "do",
        line,
        indent(join([";", line], callFieldChildren(path, print, "body"))),
        "od",
      ];
    case "qualified_expression":
      // TODO: refactor once fields are added to grammar
      return [
        path.call(print, "firstNamedChild"),
        " ",
        path.call(print, "firstNamedChild", "nextNamedSibling"),
      ];
    case "list_selector":
      return printSelector(path, print, "[", "]");
    case "sublist_selector":
      return printSelector(path, print, "{", "}");
    case "positional_selector":
      return printSelector(path, print, "![", "]");
    case "record_selector":
      return printSelector(path, print, ".", "");
    case "component_selector":
      return printSelector(path, print, "!.", "");
    case "binary_expression":
      // TODO: refactor once fields are added to grammar
      return group([
        path.call(print, "firstNamedChild"),
        " ",
        node.children[1].text,
        line,
        path.call(print, "firstNamedChild", "nextNamedSibling"),
      ]);
    case "unary_expression":
      // TODO: refactor once fields are added to grammar
      return group([node.firstChild.text, path.call(print, "firstNamedChild")]);
    case "atomic_function":
    case "function":
      return group(
        [
          node.type == "function" ? "function" : "atomic function",
          callFieldChild(path, print, "parameters"),
          indent([
            line,
            join([";", line], callFieldChildren(path, print, "locals")),
            joinInbetween([";", line], callFieldChildren(path, print, "body")),
            ";",
          ]),
          line,
          "end",
        ],
        { shouldBreak: true },
      );
    case "lambda":
      return group([
        callFieldChild(path, print, "parameters"),
        " ",
        "->",
        line,
        callFieldChild(path, print, "body"),
      ]);
    case "parameters":
    case "qualified_parameters":
      // TODO: fix once fields added to grammar
      return [
        "(",
        group(join([",", softline], path.map(print, "namedChildren"))),
        ")",
      ];
    case "lambda_parameters":
      if (node.childCount == 1) {
        return path.call(print, "firstChild");
      }
      return [
        "{",
        group(join([",", softline], path.map(print, "namedChildren"))),
        "}",
      ];
    case "locals":
      // TODO: fix once fields added to grammar
      return [
        "local",
        " ",
        group(join([",", softline], path.map(print, "namedChildren"))),
      ];
    case "return_statement":
      // TODO: fix once fields are added to grammar
      return [
        "return",
        " ",
        group(join([",", line], path.map(print, "namedChildren"))),
      ];

    case "comment":
    case "break_statement":
    case "continue_statement":
    case "identifier":
    case "integer":
    case "float":
    case "bool":
    case "char":
    case "string":
    case "tilde":
    case "ellipsis":
    case "qualifier":
    case "help_statement":
      return node.text;
    default:
      return "";
  }
}

export { printGap };
