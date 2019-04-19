module.exports = {
  hooks: {
    'pre-commit': 'lint-staged',
    'post-merge': 'package-change-checker $HUSKY_GIT_PARAMS',
    'post-rewrite': 'package-change-checker $HUSKY_GIT_PARAMS',
    'post-checkout': 'package-change-checker $HUSKY_GIT_PARAMS',
  },
};
