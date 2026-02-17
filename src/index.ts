import { SupportLanguage, Parser, Printer, ParserOptions } from "prettier";
import { print, printComment } from "./printer";
import { parse, GapNode } from "./parser";

export interface PrettierPluginParserOptions extends ParserOptions { }

export const languages: SupportLanguage[] = [
  {
    name: "gap",
    parsers: ["tree-sitter-gap"],
    extensions: [".gap", ".g", ".gi", ".gd"],
  },
];

export const parsers: Record<string, Parser<GapNode>> = {
  "tree-sitter-gap": {
    parse: parse,
    astFormat: "tree-sitter-gap-ast",
    locStart: (node: GapNode): number => node.startIndex,
    locEnd: (node: GapNode): number => node.endIndex,
  },
};

export const printers: Record<string, Printer> = {
  "tree-sitter-gap-ast": {
    print: print,
    // TODO: add extra options
    // - [ ] preprocess: to remove backslashes from text before processing
    // - [ ] getVisitorKeys: to specify which nodes are child nodes
    // getCommentChildNodes: (node: GapNode): GapNode[] => node.children,
    // canAttachComment: (): boolean => true,
    // printComment: printComment,
    // willPrintOwnComments: () => true,
  },
};
