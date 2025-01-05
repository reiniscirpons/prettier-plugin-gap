// Adapted from
// https://github.com/un-ts/toml-tools/blob/master/packages/prettier-plugin-toml/test/test-utils.js
import prettier from "prettier";
import { expect } from "chai";
import { readFileSync } from "fs";
import { dirname, resolve, relative } from "path";
import { fileURLToPath } from "url";

const _dirname = dirname(fileURLToPath(import.meta.url));
const pluginPath = "./src/index.js";

async function testSample(importMeta) {
  const testFolder = resolve(fileURLToPath(importMeta.url), "..");
  const inputPath = resolve(testFolder, "input.g");
  const expectedPath = resolve(testFolder, "expected.g");
  const relativeInputPath = relative(_dirname, inputPath);

  let inputContents;
  let expectedContents;

  before(() => {
    inputContents = readFileSync(inputPath, "utf8");
    expectedContents = readFileSync(expectedPath, "utf8");
  });

  it(`Check formatting <${relativeInputPath}>`, async () => {
    const actual = await prettier.format(inputContents, {
      parser: "tree-sitter-gap",
      plugins: [pluginPath],
    });

    expect(actual).to.equal(expectedContents);
  });

  it(`Check idempotency <${relativeInputPath}>`, async () => {
    const onePass = await prettier.format(inputContents, {
      parser: "tree-sitter-gap",
      plugins: [pluginPath],
    });

    const secondPass = await prettier.format(onePass, {
      parser: "tree-sitter-gap",
      plugins: [pluginPath],
    });
    expect(onePass).to.equal(secondPass);
  });
}

export { testSample };
