const { resolve } = require('path');
const buildPath = resolve(__dirname, "build");
const glob = require('tiny-glob');

const { build } = require('esbuild');
let entryPoints = glob('./client/*.ts');

build({
    entryPoints: entryPoints,
    outdir: resolve(buildPath, 'client'),
    bundle: true,
    minify: true,
    platform: 'browser',
    target: 'es2020',
    logLevel: 'info',
    watch: true
}).catch(() => process.exit(1));