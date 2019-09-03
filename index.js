module.exports = {
  hooks: {
    'pre-commit': 'lint-staged',
    'post-merge': 'package-change-checker',
    'post-rewrite': 'package-change-checker $HUSKY_GIT_STDIN',
    'post-checkout': './helpers/post-checkout.sh',
  },
};
