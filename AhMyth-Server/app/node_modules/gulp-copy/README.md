[![npm version](https://badge.fury.io/js/gulp-copy.svg)](https://www.npmjs.com/package/gulp-copy)
[![build status](https://circleci.com/gh/klaascuvelier/gulp-copy.svg?style=shield&circle-token=1dddfa2a1b153a5e5b7c00598a42b66842169eb2)](https://circleci.com/gh/klaascuvelier/gulp-copy/)

# gulp-copy

Copy source files to new destination and use that destination as new source (for further piping).
Automatically creates needed folders before proceeding. Ability to remove 'prefixes' from path.

Most likely you don't need this package for your gulp pipeline, a lot can be accomplished with just `gulp.dest`.
A reason to use this package would be to keep some depth (prefix options).

## Usage

```js
// gulpfile.js

var gulpCopy = require('gulp-copy');
var otherGulpFunction = require('gulp-other-function');
var sourceFiles = ['source1/*', 'source2/*.txt'];
var destination = 'dest/';
var outputPath = 'some-other-dest/';

return gulp
    .src(sourceFiles)
    .pipe(gulpCopy(outputPath, options))
    .pipe(otherGulpFunction())
    .dest(destination);
```

### Options

`prefix`: integer, defining how many parts of the path (separated by /) should be removed from the original path

### Example

A simple implemention of a gulpfile using `gulp-copy` is available in the [example](./example) folder.
You can run `gulp` or `npx gulp` from within the folder.

## Updates

See [changelog](CHANGELOG.md) for all updates.
