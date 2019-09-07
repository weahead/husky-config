#!/bin/sh

# read commit message file location into variable
message_file=$(git rev-parse --git-path COMMIT_EDITMSG)

# remove starting/trailing newlines from commit message file as they might
# cause commitlint errors if not handled correctly by the user.
# sed command adapted from https://stackoverflow.com/a/7359879/9735558
sed -i '' -e :a -e '/./,$!d;/^\n*$/{$d;N;};/\n$/ba' "${message_file}"

# create a variable that holds the commit message without comments (lines
# that start with #) and blank/empty lines.
commit_message_cleaned=$(sed -E -e '/^(#|$)/d' "${message_file}")

# If cleaned commit message is empty
if [ "${commit_message_cleaned}" = "" ]; then
  # If configured to not use commitizen
  if [ "$(git config --get wa.noautocz)" = "true" ]; then
    # User does not want help authoring commit message from commitizen
    # Proceed with letting user manually author a commit message
    echo "ℹ️  wa.noautocz set to true, skipping commitizen"
    exit 0
  fi
# if cleaned commit message is NOT empty
else
  rebase_dir=$(git rev-parse --git-path rebase-merge)
  # If interactive rebase is in progress, during squash operation all of the
  # squashed commit messages are concatenated together to form a big commit message.
  # In the squash case we let the user manually handle filtering out what
  # messages to include in the final commit message.
  if [ -f "${rebase_dir}/interactive" ] && [ -f "${rebase_dir}/message-squash"  ]; then
    # We remove empty lines that proceed commit messages to help users to
    # not have to worry about that line as it will cause lint errors from
    # commitlint if left as is by the user. The reason for this is because the
    # commit message might end up with an empty line as its first line if not
    # handled correctly by the user.
    #
    # Example of concatenaded commit messages
    # (disregard the spaces before the arrows used for stylistic purposes):
    #
    # ## This is a combination of 3 commits.
    # ## This is the 1st commit message:
    #                                         <--- possible problematic empty line
    # feat(scope): a valid commit message
    #
    # # This is the commit message #2:
    #                                         <--- possible problematic empty line
    # chore(scope): another valid commit message
    #
    # # This is the commit message #3:
    #                                         <--- possible problematic empty line
    # chore(scope): a third valid commit message
    #
    # If the "possible problematic empty lines" are left in the final commit
    # message it would make the first line of the final commit message start
    # with an empty line, as comments (lines that start with #) are stripped
    # from the final message by git but blank lines are left as is.
    # Having a blank line as the first line of a commit message does not pass
    # commitlint validation.
    #
    # sed command adapted from https://unix.stackexchange.com/a/407891
    sed -i '' '/^# This is the/ {n;d;}' .git/COMMIT_EDITMSG
    exit 0
  # If commit message is valid ('commitlint -e' checks the above referenced
  # commit message file location)
  elif commitlint -e; then
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
