// Tree-sitter parser AST node wrapper

// TODO: Wrap AST nodes in a proxy object

import { SyntaxNode } from "tree-sitter";
import TSParser from "tree-sitter";
import GapLanguage from "tree-sitter-gap";

export class GapNode {
  private internal_node: SyntaxNode;
  // public comments: GapNode[];
  // // Some weird stuff for comment attachment
  // public enclosingNode?: GapNode | undefined;
  // public precedingNode?: GapNode | undefined;
  // public followingNode?: GapNode | undefined;
  // public placement?: string | undefined;
  // public marker?: string | undefined;
  // public printed?: boolean | undefined;
  // public leading?: boolean | undefined;
  // public trailing?: boolean | undefined;

  constructor(internal_node: SyntaxNode) {
    this.internal_node = internal_node;
    // this.printed = false;
    // this.comments = [];
  }

  get type(): string {
    // Hack until we change this in the tree sitter grammar
    if (
      this.internal_node.type == "function" &&
      this.internal_node.children.length > 0
    ) {
      return "function_expression";
    }
    return this.internal_node.type;
  }

  get text(): string {
    return this.internal_node.text;
  }

  get value(): string {
    return this.internal_node.text;
  }

  get startIndex(): number {
    return this.internal_node.startIndex;
  }

  get endIndex(): number {
    return this.internal_node.endIndex;
  }

  get recordAndComponentSelectorChain(): GapNode[] | null {
    if (this.type != "record_selector" && this.type != "component_selector") {
      return null;
    }
    let node: GapNode = this;
    let selectors = [];
    while (
      node.type == "record_selector" ||
      node.type == "component_selector"
    ) {
      selectors.push(node.children.slice(1));
      if (node.firstChild == null) {
        throw new Error(
          "Wrong number of children for a record or component selector!",
        );
      }
      node = node.firstChild;
    }
    return [node].concat(selectors.reverse().flat());
  }

  get children(): GapNode[] {
    return this.internal_node.children
      .filter((child: SyntaxNode) => child.type != "comment")
      .map((child: SyntaxNode) => new GapNode(child));
  }

  get firstChild(): GapNode | null {
    const node = this.internal_node.firstChild;
    if (node == null) {
      return null;
    }
    const child = new GapNode(node);
    if (child.type == "comment") {
      return child.nextSibling;
    }
    return child;
  }

  get nextSibling(): GapNode | null {
    let node = this.internal_node.nextSibling;
    while (node != null && node.type == "comment") {
      node = node.nextSibling;
    }
    if (node == null) {
      return null;
    }
    return new GapNode(node);
  }

  findChildIndexByType(type: string): number {
    return this.children.findIndex((child: GapNode) => child.type == type);
  }

  findChildLastIndexByType(type: string): number {
    return this.children.findLastIndex((child: GapNode) => child.type == type);
  }

  findChildIndexByField(field_name: string): number {
    const field_child = this.internal_node.childForFieldName(field_name);
    if (field_child == null) {
      return -1;
    }
    return this.children.findIndex(
      (child: GapNode) => child.internal_node.id == field_child.id,
    );
  }

  findChildLastIndexByField(field_name: string): number {
    const field_child = this.internal_node.childForFieldName(field_name);
    if (field_child == null) {
      return -1;
    }
    return this.children.findLastIndex(
      (child: GapNode) => child.internal_node.id == field_child.id,
    );
  }

  getComments(): GapNode[] {
    return this.internal_node
      .descendantsOfType("comment")
      .map((child: SyntaxNode) => new GapNode(child));
  }
}

const parser = new TSParser();
parser.setLanguage(GapLanguage as TSParser.Language);

export function parse(text: string) {
  const result = new GapNode(parser.parse(text).rootNode);
  // result.comments = result.getComments();
  return result;
}

// TODO:
// - [x] node.type: keep
// - [x] node.startIndex: keep
// - [x] node.endIndex: keep
// - [x] node.text: keep
// - [ ] node.children:
//   - [x] keep, skip comments, wrap
//   - [ ] handle record and selector chains
// - [x] node.nextSibling: keep, skip comments, wrap
// - [x] node.childForFieldName: Change to childIndexForFieldName
// - [x] node.comments: Recursively get all comment nodes
// - [ ] Wrap tree-sitter parse to get and fixup all newlines and have them as nodes in top level
