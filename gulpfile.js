var babel, coffee, concat, gulp, gulpif, merge, util;

babel = require("gulp-babel");
coffee = require("gulp-coffee");
concat = require("gulp-concat");
gulp = require("gulp");
gulpif = require("gulp-if");
merge = require("merge-stream");
util = require("gulp-util");

gulp.task("default", function () {
    return gulp.src("./source/javascripts/**/*")
        .pipe(gulpif(/[.]coffee$/, coffee({ bare: true }).on("error", util.log)))
        .pipe(babel({ presets: ["es2015"] }))
        .pipe(concat("all.js"))
        .pipe(gulp.dest("./dist/javascripts/"));
});
