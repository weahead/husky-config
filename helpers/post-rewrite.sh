#!/bin/sh

end=0
current=0

rebase_merge_dir=$(git rev-parse --git-path rebase-merge)
rebase_apply_dir=$(git rev-parse --git-path rebase-apply)
if [ -d "${rebase_merge_dir}" ]; then
  rebase_dir="${rebase_merge_dir}"
elif [ -d "${rebase_apply_dir}" ]; then
  rebase_dir="${rebase_apply_dir}"
fi

if [ -d "${rebase_dir}" ]; then
  if [ -f "${rebase_dir}/end" ] && [ -f "${rebase_dir}/msgnum" ]; then
    end=$(cat "${rebase_dir}/end")
    current=$(cat "${rebase_dir}/msgnum")
  fi
fi

if [ "${end}" = "${current}" ]; then
  # Rewrite complete, run package-change-checker

  # The command to run is passed from index.js
  cmd="${1}"

  # shellcheck disable=SC2086
  package-change-checker --install-cmd="${cmd}" ${HUSKY_GIT_STDIN}
fi
