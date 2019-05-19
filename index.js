module.exports = {
  hooks: {
    'pre-commit': 'lint-staged',
    'post-merge': 'package-change-checker',
    'post-rewrite': 'package-change-checker $HUSKY_GIT_STDIN',
    'post-checkout':
      '(test -d "$(git rev-parse --git-path rebase-merge)" || test -d "$(git rev-parse --git-path rebase-apply)" ) || package-change-checker $HUSKY_GIT_PARAMS',
  },
};
