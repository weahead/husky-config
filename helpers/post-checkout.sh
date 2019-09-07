#!/bin/sh

# Do not run package-change-checker for checkout during a rebase
if [ -d "$(git rev-parse --git-path rebase-merge)" ] || [ -d "$(git rev-parse --git-path rebase-apply)" ]; then
  exit 0
fi

package-change-checker ${HUSKY_GIT_PARAMS}
