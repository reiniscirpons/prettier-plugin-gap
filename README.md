# Prettier plugin gap

> **WARNING**: The formatter plugin is experimental and not yet fully
> implemented. Use at your own risk.

A [`prettier`][prettier] plugin for formatting
[`gap`](https://www.gap-system.org/) files.

## Instructions

The [`prettier`][prettier] formatter is part of the javascript ecosystem,
hence to use this plugin we will need to use a javascript package manager,
such as [`npm`][npm] or [`pnpm`][pnpm].
We will proceed assuming a `npm` installation is available.

To test the formatting, first clone and install the project dependencies:

```bash
git clone https://github.com/reiniscirpons/prettier-plugin-gap
cd prettier-plugingap
npm install
```

The plugin tests can be run via:

```bash
npm run test
```

To use the plugin in [`prettier`][prettier], the following
~~ungodly hack~~ _creative approach to the jacascript ecosystem_
is neccesary:

```bash
npm run build # This command should generate a ./lib/index.js file
echo "npx prettier --tab-width=2 --plugin=$PWD/lib/index.js"
```

this should build the plugin sources and display an artisially crafted
command that you can use to call `prettier` using the
`prettier-plugin-gap`. The remaining usage should be the same as with
the base `prettier` tool, e.g. :

```bash
# Format a file to stdout (without overwriting the file)
npx prettier --tab-width --plugin=/home/rcirpons/prettier-plugin-gap/lib/index.js FILE.g
# Format and overwrite a file
npx prettier --tab-width --plugin=/home/rcirpons/prettier-plugin-gap/lib/index.js --write FILE.g
# Format and overwrite a whole directory
npx prettier --tab-width --plugin=/home/rcirpons/prettier-plugin-gap/lib/index.js --write dir/
```

where `/home/rcirpons/prettier-plugin-gap/lib/index.js` is an example output
from the `echo` command we ran above, yours may differ.


[prettier]: https://prettier.io/
[npm]: https://docs.npmjs.com/downloading-and-installing-node-js-and-npm
[pnpm]: https://pnpm.io/installation
