var gulp = require("gulp");
var babel = require("gulp-babel");

gulp.task("default", function () {
    return gulp.src("source/javascripts/all.js")
        .pipe(babel({ presets: ['es2015'] }))
        .pipe(gulp.dest("dist/javascripts"));
});
