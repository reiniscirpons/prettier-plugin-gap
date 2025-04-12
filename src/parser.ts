// Tree-sitter parser AST node wrapper

// TODO: Wrap AST nodes in a proxy object

import { SyntaxNode } from "tree-sitter";

export class GapNode {
  private internal_node: SyntaxNode;

  constructor(internal_node: SyntaxNode) {
    this.internal_node = internal_node;
  }

  get type(): string {
    return this.internal_node.type;
  }

  get text(): string {
    return this.internal_node.text;
  }

  get startIndex(): number {
    return this.internal_node.startIndex;
  }

  get endIndex(): number {
    return this.internal_node.endIndex;
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

  get comments(): GapNode[] {
    return this.internal_node
      .descendantsOfType("comment")
      .map((child: SyntaxNode) => new GapNode(child));
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
