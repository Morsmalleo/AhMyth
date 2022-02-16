# gulp-replace [![NPM version][npm-image]][npm-url] [![Build status][travis-image]][travis-url]

> A string replace plugin for gulp

## Usage

First, install `gulp-replace` as a development dependency:

```shell
npm install --save-dev gulp-replace
# or
yarn add --dev gulp-replace
```

Then, add it to your `gulpfile.js`:

### Simple string replace

```javascript
const replace = require('gulp-replace');

gulp.task('templates', function(){
  gulp.src(['file.txt'])
    .pipe(replace('bar', 'foo'))
    .pipe(gulp.dest('build/'));
});
```

### Simple regex replace

```javascript
const replace = require('gulp-replace');

gulp.task('templates', function(){
  gulp.src(['file.txt'])
    // See https://mdn.io/string.replace#Specifying_a_string_as_a_parameter
    .pipe(replace(/foo(.{3})/g, '$1foo'))
    .pipe(gulp.dest('build/'));
});
```

### String replace with function callback

```javascript
const replace = require('gulp-replace');

gulp.task('templates', function(){
  gulp.src(['file.txt'])
    .pipe(replace('foo', function(match) {
      // Replaces instances of "foo" with "oof"
      return match.reverse();
    }))
    .pipe(gulp.dest('build/'));
});
```

### Regex replace with function callback

```javascript
const replace = require('gulp-replace');

gulp.task('templates', function(){
  gulp.src(['file.txt'])
    .pipe(replace(/foo(.{3})/g, function(match, p1, offset, string) {
      // Replace foobaz with barbaz and log a ton of information
      // See https://mdn.io/string.replace#Specifying_a_function_as_a_parameter
      console.log('Found ' + match + ' with param ' + p1 + ' at ' + offset + ' inside of ' + string);
      return 'bar' + p1;
    }))
    .pipe(gulp.dest('build/'));
});
```

### Function callback with file object

```javascript
const replace = require('gulp-replace');

gulp.task('templates', function(){
  gulp.src(['file.txt'])
    .pipe(replace('filename', function() {
      // Replaces instances of "filename" with "file.txt"
      // this.file is also available for regex replace
      // See https://github.com/gulpjs/vinyl#instance-properties for details on available properties
      return this.file.relative;
    }))
    .pipe(gulp.dest('build/'));
});
```

## API

`gulp-replace` can be called with a string or regex.

### replace(string, replacement[, options])

#### string

Type: `String`

The string to search for.

#### replacement

Type: `String` or `Function`

The replacement string or function. If `replacement` is a function, it will be called once for each match and will be passed the string that is to be replaced.

The value of `this.file` will be equal to the [vinyl instance](https://github.com/gulpjs/vinyl#instance-properties) for the file being processed.

### replace(regex, replacement[, options])

#### regex

Type: `RegExp`

The regex pattern to search for. See the [MDN documentation for RegExp] for details.

#### replacement

Type: `String` or `Function`

The replacement string or function. See the [MDN documentation for String.replace] for details on special replacement string patterns and arguments to the replacement function.

The value of `this.file` will be equal to the [vinyl instance](https://github.com/gulpjs/vinyl#instance-properties) for the file being processed.

### gulp-replace options

An optional third argument, `options`, can be passed.

#### options

Type: `Object`

##### options.skipBinary

Type: `boolean`  
Default: `true`

Skip binary files. This option is `true` by default. If you want to replace content in binary files, you must explicitly set it to `false`.

[MDN documentation for RegExp]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp
[MDN documentation for String.replace]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace#Specifying_a_string_as_a_parameter

[travis-url]: https://travis-ci.org/lazd/gulp-replace
[travis-image]: https://secure.travis-ci.org/lazd/gulp-replace.svg?branch=master
[npm-url]: https://npmjs.org/package/gulp-replace
[npm-image]: https://badge.fury.io/js/gulp-replace.svg
