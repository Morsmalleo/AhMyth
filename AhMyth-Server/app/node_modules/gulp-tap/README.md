# gulp-tap [![Build Status](https://travis-ci.org/geejs/gulp-tap.svg?branch=master)](https://travis-ci.org/geejs/gulp-tap) [![Coverage Status](https://coveralls.io/repos/github/geejs/gulp-tap/badge.svg?branch=master)](https://coveralls.io/github/geejs/gulp-tap?branch=master) [![Dependencies Status](https://david-dm.org/geejs/gulp-tap.svg)](https://david-dm.org/geejs/gulp-tap)

Easily tap into a pipeline.

## Uses

Some filters like `gulp-coffee` process all files. What if you want to process
all JS and Coffee files in a single pipeline. Use `tap` to filter out `.coffee`
files and process them through the `coffee` filter and let JavaScript files
pass through.

```js
gulp.src("src/**/*.{coffee,js}")
    .pipe(tap(function(file, t) {
        if (path.extname(file.path) === '.coffee') {
            return t.through(coffee, []);
        }
    }))
    .pipe(gulp.dest('build'));
```

What if you want to change content like add a header? No need for a separate
filter, just change the content.

```js
tap(function(file) {
    file.contents = Buffer.concat([
        new Buffer('HEADER'),
        file.contents
    ]);
});
```

If you do not return a stream, tap forwards your changes.

## Examples

See [Wiki](https://github.com/geejs/gulp-tap/wiki) for more examples.

## License

The MIT License (MIT)
