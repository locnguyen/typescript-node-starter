/**
 * This file is needed for running the code compiled into the outDir configured
 * in tsconfig.json. Without it Node looks for files in the src/ folder.
 *
 * https://github.com/Microsoft/TypeScript/issues/10866#issuecomment-246929461
 */

const path = require('path');
const tsConfigPaths = require('tsconfig-paths');
const tsConfig = require('./tsconfig.json');

const baseUrl = path.join(__dirname, 'build');

tsConfigPaths.register({
    baseUrl,
    paths: tsConfig.compilerOptions.paths
});