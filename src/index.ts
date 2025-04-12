import { SupportLanguage, Parser, Printer, ParserOptions } from "prettier";
import { print } from "./printer";
import { GapNode } from "./parser";
import TSParser from "tree-sitter";
import GapLanguage from "tree-sitter-gap";

const parser = new TSParser();
parser.setLanguage(GapLanguage as TSParser.Language);

export interface PrettierPluginParserOptions extends ParserOptions {}

export const languages: SupportLanguage[] = [
  {
    name: "gap",
    parsers: ["tree-sitter-gap"],
    extensions: [".gap", ".g", ".gi", ".gd"],
  },
];

export const parsers: Record<string, Parser> = {
  "tree-sitter-gap": {
    parse: (text) => new GapNode(parser.parse(text).rootNode),
    astFormat: "tree-sitter-gap-ast",
    locStart: (node) => node.startIndex,
    locEnd: (node) => node.endIndex,
  },
};

export const printers: Record<string, Printer> = {
  "tree-sitter-gap-ast": {
    print: print,
    // TODO: add extra options
    // - [ ] preprocess: to remove backslashes from text before processing
    // - [ ] getVisitorKeys: to specify which nodes are child nodes
  },
};
