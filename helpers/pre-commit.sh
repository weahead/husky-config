#!/bin/sh

at_count=$(echo "${GIT_AUTHOR_EMAIL}" | tr -cd '@' | wc -c | tr -d ' ')
if [ "${at_count}" = "1" ]; then
  case "${GIT_AUTHOR_EMAIL}" in
  *@weahead.se)
    exit 0
    ;;
  esac
fi
echo ""
echo "Author e-mail of \"${GIT_AUTHOR_EMAIL}\" is not correct."
echo "A @weahead.se e-mail is required to create a commit in this repository."
echo ""
echo "A recommended approach is to create or update your local git configuration for this repository."
echo "NOTE: This will make you commit with your @weahead.se e-mail address ONLY in this repository."
echo "To commit as your @weahead.se e-mail address in ANOTHER repository, you would have to run the same command in that repository too."
echo "To create or update your local git configuration for this repository run the following:"
echo "git config --local user.name \"Your Name\""
echo "git config --local user.email \"your.name@weahead.se\""
echo ""
echo "Another, less recommended but also viable approach, is to create or update your global git configuration."
echo "NOTE: This will make you commit with your @weahead.se e-mail address in ALL your repositories/clones."
echo "To create or update your global git configuration run the following:"
echo "git config --global user.name \"Your Name\""
echo "git config --global user.email \"your.name@weahead.se\""
echo ""
exit 1
