#!/bin/sh

if [ ! -d "$(git rev-parse --git-path rebase-merge)" ] && [ ! -d "$(git rev-parse --git-path rebase-apply)" ]; then
  package-change-checker ${HUSKY_GIT_PARAMS}
fi
