var copy = require('../index');
var gulp = require('gulp');
var through = require('through2');

gulp.task('default', copyFunction);

function copyFunction() {
    return gulp
        .src([' ./files/.*', './files/*.*'])
        .pipe(copy('output/test', { prefix: 1 }))
        .pipe(verify());
}

function verify() {
    var options = { objectMode: true };
    return through(options, write, end);

    function write(file, enc, cb) {
        console.log('file', file.path);
        cb(null, file);
    }

    function end(cb) {
        console.log('done');
        cb();
    }
}
