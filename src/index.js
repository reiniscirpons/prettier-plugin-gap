import { printGap } from "./printer.js";
import Parser from "tree-sitter";
import GapLanguage from "tree-sitter-gap";

const parser = new Parser();
parser.setLanguage(GapLanguage);

const languages = [
  {
    name: "gap",
    parsers: ["tree-sitter-gap"],
    extensions: [".gap", ".g", ".gi", ".gd"],
  },
];

const parsers = {
  "tree-sitter-gap": {
    parse: (text) => parser.parse(text).rootNode,
    astFormat: "tree-sitter-gap-ast",
    // TODO: Add locStart and locEnd fields for getting the byte-position of a node
    // TODO: Add preprocess field for removing line breaks from code
  },
};

const printers = {
  "tree-sitter-gap-ast": {
    print: printGap,
  },
};

export { languages, parsers, printers };
