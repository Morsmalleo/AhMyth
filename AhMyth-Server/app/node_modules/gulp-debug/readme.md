# gulp-debug [![Build Status](https://travis-ci.org/sindresorhus/gulp-debug.svg?branch=master)](https://travis-ci.org/sindresorhus/gulp-debug)

> Debug [Vinyl](https://github.com/gulpjs/vinyl) file streams to see what files are run through your Gulp pipeline

<img src="screenshot.png" width="415">


## Install

```
$ npm install --save-dev gulp-debug
```


## Usage

```js
const gulp = require('gulp');
const debug = require('gulp-debug');

gulp.task('default', () =>
	gulp.src('foo.js')
		.pipe(debug({title: 'unicorn:'}))
		.pipe(gulp.dest('dist'))
);
```


## API

### debug([options])

#### options

Type: `Object`

##### title

Type: `string`<br>
Default: `gulp-debug:`

Give it a custom title so it's possible to distinguish the output of multiple instances logging at once.

##### minimal

Type: `boolean`<br>
Default: `true`

By default only relative paths are shown. Turn off minimal mode to also show `cwd`, `base`, `path`.

The [`stat` property](http://nodejs.org/api/fs.html#fs_class_fs_stats) will be shown when you run gulp in verbose mode: `gulp --verbose`.

##### showFiles

Type: `boolean`<br>
Default: `true`

Print filenames.

##### showCount

Type: `boolean`<br>
Default: `true`

Print the file count.

##### logger(message)

Type: `Function`<br>
Default: [`fancy-log`](https://github.com/js-cli/fancy-log)

Provide your own logging utility in place of [fancy-log](https://github.com/js-cli/fancy-log). The message is passed as a string in the first argument. Note that [ANSI colors](https://github.com/chalk/chalk) may be used in the message.


## License

MIT © [Sindre Sorhus](https://sindresorhus.com)
