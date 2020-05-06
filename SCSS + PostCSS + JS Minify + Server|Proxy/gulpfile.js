const { src, dest, watch, series } = require('gulp');
const browserSync = require('browser-sync').create();
const sass = require('gulp-sass');
const postcss = require('gulp-postcss');
const autoprefixer = require('autoprefixer');
const cssnano = require('cssnano');
const sourcemaps = require('gulp-sourcemaps');
const uglify = require('gulp-uglify-es').default;

function css() {
    let plugins = [
        autoprefixer(),
        cssnano()
    ];
    return src('src/scss/*.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(sourcemaps.init())
        .pipe(postcss(plugins))
        .pipe(sourcemaps.write())
        .pipe(dest('dist/css/'));
}

function js() {
    console.log('js')
    return src('src/js/*.js')
        .pipe(uglify())
        .pipe(dest('dist/js/'));
}

function server(cb) {
    browserSync.init({
        open: false,
        server: {
            baseDir: 'dist'
        }
    });
    watch('src/js/*.js').on('change', () => {
        js();
        browserSync.reload();
    });
    watch('src/scss/*.scss').on('change', () => {
        css();
        browserSync.reload();
    });
    watch('dist/index.html').on('change', browserSync.reload);
    watch('index.js').on('change', browserSync.reload);
    cb();
}

function proxy(cb) {
    browserSync.init({
        proxy: 'localhost:8000'
    });
    warch('src/js/*.js').on('change', () => {
        js();
        browserSync.reload();
    });
    watch('src/scss/*.scss').on('change', () => {
        css();
        browserSync.reload();
    });
    watch('dist/index.html').on('change', browserSync.reload);
    watch('index.js').on('change', browserSync.reload);
    cb();
}

module.exports.server = server;
module.exports.proxy = proxy;
module.exports.buildCss = css;