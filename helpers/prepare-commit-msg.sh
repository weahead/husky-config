#!/bin/sh

# If empty commit message
if [ "$( sed -e 's/#.*//g' .git/COMMIT_EDITMSG | tr -d '\n')" = "" ]; then
  # If configured to not use commitizen
  if [ "$(git config --get wa.noautocz)" = "true" ]; then
    # User does not want help authoring commit message from commitizen
    # Process with authoring commit message
    echo "ℹ️  wa.noautocz set to true, skipping commitizen"
    exit 0
  fi
else
  # If written a valid commit message manually
  if commitlint -e; then
    # Proceed with commit
    exit 0
  else
    echo "❌  Commit message is not valid."
    echo "🖊️  Starting commitizen to help author a commit message..."
    echo
    # Let the error message sit for a second so that the user registers/sees it
    sleep 1
  fi
fi

# In all other cases, use commitizen to author commit message
(exec < /dev/tty && git cz --hook)
