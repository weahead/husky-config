const fs = require('fs');
const basePath = __dirname;
const isYarn = fs.existsSync('./yarn.lock');
const install = `${isYarn ? 'yarn' : 'npm'} install`;

module.exports = {
  hooks: {
    'pre-commit': 'lint-staged',
    'prepare-commit-msg': `${basePath}/helpers/prepare-commit-msg.sh`,
    'commit-msg': 'commitlint -E HUSKY_GIT_PARAMS',
    'post-merge': `package-change-checker --install-cmd="${install}"`,
    'post-rewrite': `${basePath}/helpers/post-rewrite.sh "${install}"`,
    'post-checkout': `${basePath}/helpers/post-checkout.sh "${install}"`,
  },
};
