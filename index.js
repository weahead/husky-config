module.exports = {
  hooks: {
    'pre-commit': 'lint-staged',
    'prepare-commit-msg': './helpers/prepare-commit-msg.sh',
    'commit-msg': 'commitlint -E HUSKY_GIT_PARAMS',
    'post-merge': 'package-change-checker',
    'post-rewrite': 'package-change-checker $HUSKY_GIT_STDIN',
    'post-checkout': './helpers/post-checkout.sh',
  },
};
