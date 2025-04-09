import { existsSync, readdirSync, readFileSync } from "fs";
import { join } from "path";
import * as prettier from "prettier";
import * as GapPlugin from "../src/index";

const prettify = (
  code: string,
  options: GapPlugin.PrettierPluginParserOptions,
) =>
  prettier.format(code, {
    ...options,
    parser: "tree-sitter-gap",
    plugins: [GapPlugin],
  });

const testFolder = join(__dirname, "samples");
const tests = readdirSync(testFolder);

describe("format", () => {
  tests.forEach((test) =>
    it(test, async () => {
      const path = join(testFolder, test);
      const input = readFileSync(join(path, "input.g")).toString();
      const expected = readFileSync(join(path, "output.g")).toString();

      const configPath = join(path, "config.json");
      const configString =
        existsSync(configPath) && readFileSync(configPath)?.toString();
      const configObject = configString ? JSON.parse(configString) : {};

      const expectedError = expected.match(/Error\("(?<message>.*)"\)/)?.groups
        ?.message;

      const format = () => prettify(input, configObject);

      if (expectedError) {
        jest.spyOn(console, "error").mockImplementation(() => { });
        await expect(format()).rejects.toEqual(new Error(expectedError));
      } else {
        const result = prettify(input, configObject);
        await expect(await result).toEqual(expected);
        // Check idempotence
        await expect(await prettify(await result, configObject)).toEqual(
          expected,
        );
      }
    }),
  );
});
