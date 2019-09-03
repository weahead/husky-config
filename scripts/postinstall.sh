#!/bin/sh

if [ ! -f "${INIT_CWD}/.huskyrc.js" ]; then
  echo "module.exports = require('@weahead/husky-config');" > "${INIT_CWD}/.huskyrc.js"
fi
