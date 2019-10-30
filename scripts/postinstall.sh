#!/bin/sh

if [ ! -f "${INIT_CWD}/.huskyrc.js" ]; then
  echo "module.exports = require('@weahead/husky-config');" > "${INIT_CWD}/.huskyrc.js"
fi

if [ ! -f "${INIT_CWD}/.cz.json" ]; then
  cz='{
  "path": "cz-conventional-changelog",
  "maxHeaderWidth": 72,
  "maxLineWidth": 72,
  "defaultType": "",
  "defaultScope": "",
  "defaultSubject": "",
  "defaultBody": "",
  "defaultIssues": ""
}
'
  echo "${cz}" >"${INIT_CWD}/.cz.json"
fi
