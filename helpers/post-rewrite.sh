#!/bin/sh

rebase_dir=$(git rev-parse --git-path rebase-merge)
end=$(cat "${rebase_dir}/end")
current=$(cat "${rebase_dir}/msgnum")

if [ "${end}" = "${current}" ]; then
  # Rebase complete, run package-change-checker

  # The command to run is passed from index.js
  cmd="${1}"

  # shellcheck disable=SC2086
  package-change-checker --install-cmd="${cmd}" ${HUSKY_GIT_STDIN}
fi
