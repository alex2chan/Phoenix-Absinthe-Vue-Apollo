const path = require('path');

module.exports = {
  publicPath: './',
  lintOnSave: false,
  runtimeCompiler: true,
  outputDir: path.resolve(__dirname, '../priv/static')
}
