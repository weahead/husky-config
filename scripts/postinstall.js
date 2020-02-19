const fs = require('fs');
const path = require('path');

const huskyrcPath = path.join(process.env.INIT_CWD, '.huskyrc.js');
const czPath = path.join(process.env.INIT_CWD, '.cz.json');

const czConfigObj = {
  path: 'cz-conventional-changelog',
  maxHeaderWidth: 72,
  maxLineWidth: 72,
  defaultType: '',
  defaultScope: '',
  defaultSubject: '',
  defaultBody: '',
  defaultIssues: '',
};

if (!fs.existsSync(czPath)) {
  fs.writeFileSync(czPath, JSON.stringify(czConfigObj, null, 2));
}

if (!fs.existsSync(huskyrcPath)) {
  fs.writeFileSync(
    huskyrcPath,
    "module.exports = require('@weahead/husky-config');"
  );
}
