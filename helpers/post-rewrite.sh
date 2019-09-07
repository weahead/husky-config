#!/bin/sh

# The command to run is passed from index.js
cmd="${1}"

# shellcheck disable=SC2086
package-change-checker --install-cmd="${cmd}" ${HUSKY_GIT_STDIN}
