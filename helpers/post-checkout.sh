#!/bin/sh

# Do not run package-change-checker for checkout during a rebase
if [ -d "$(git rev-parse --git-path rebase-merge)" ] || [ -d "$(git rev-parse --git-path rebase-apply)" ]; then
  exit 0
fi

# The command to run is passed from index.js
cmd="${1}"

package-change-checker --install-cmd="${cmd}" ${HUSKY_GIT_PARAMS}
