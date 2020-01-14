# @weahead/husky-config

[We aheads](https://www.weahead.se/) configuration for Husky.

## Install

This config and its dependencies are included in We ahead's tooling packages and don't need to be installed in new We ahead projects. Instead use one of the tooling packages that have all configs and dependencies needed for its use.

- For **non-React** projects use [@weahead/tooling](https://github.com/weahead/tooling)
- For **React** projects use [@weahead/tooling-react](https://github.com/weahead/tooling-react)

### Install the config by its own

```
npx install-peerdeps -d -x '-E' @weahead/husky-config
```

### These files will automatically be created in the root of your project:

`.huskyrc.js` file with the content:

```
module.exports = require('@weahead/husky-config');
```

`.cz.json` file with the content:

```
{
  "path": "cz-conventional-changelog",
  "maxHeaderWidth": 72,
  "maxLineWidth": 72,
  "defaultType": "",
  "defaultScope": "",
  "defaultSubject": "",
  "defaultBody": "",
  "defaultIssues": ""
}
```

#### Turn off Commitizen

Use this config if you don't want help from [Commitizen](http://commitizen.github.io/cz-cli/)
to create commit messages:

`git config --global wa.noautocz true`

**_Note!_** This does not turn off the linting of your commit messages,
it only turns off the help from `Commitizen` when creating the commit message.

## License

[X11](LICENSE)
