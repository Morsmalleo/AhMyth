# gulp-json-editor

[![npm version](https://badge.fury.io/js/gulp-json-editor.svg)](https://www.npmjs.com/package/gulp-json-editor)
[![Build Status](https://secure.travis-ci.org/rejas/gulp-json-editor.png?branch=master)](https://travis-ci.org/rejas/gulp-json-editor) 

gulp-json-editor is a [gulp](https://github.com/gulpjs/gulp) plugin to edit JSON objects.

## Usage
```javascript
var jeditor = require("gulp-json-editor");

/*
  edit JSON object by merging with user specific object
*/
gulp.src("./manifest.json")
  .pipe(jeditor({
    'version': '1.2.3'
  }))
  .pipe(gulp.dest("./dest"));

/*
  edit JSON object by using user specific function
*/
gulp.src("./manifest.json")
  .pipe(jeditor(function(json) {
    json.version = "1.2.3";
    return json; // must return JSON object.
  }))
  .pipe(gulp.dest("./dest"));

/*
  specify [js-beautify](https://github.com/beautify-web/js-beautify) option
*/
gulp.src("./manifest.json")
  .pipe(jeditor({
    'version': '1.2.3'
  },
  // the second argument is passed to js-beautify as its option
  {
    'indent_char': '\t',
    'indent_size': 1
  }))
  .pipe(gulp.dest("./dest"));

/*
  specify [deepmerge](https://github.com/TehShrike/deepmerge) option
*/
gulp.src("./manifest.json")
  .pipe(jeditor({ 
    "authors": ["tomcat"] 
  },
  // the second argument is passed to js-beautify as its option
  {},
  // the third argument is passed to deepmerge options, eg, arrayMerge options
  { 
    arrayMerge: function (dist,source,options) {return source;} 
  }))
  .pipe(gulp.dest("./dest"));
```

### Note
In case of such above situation, all of comment and whitespace in source file is **NOT** kept in destination file.

### Disable beautification

```javascript
gulp.src("./manifest.json")
  .pipe(jeditor({
    'version': '1.2.3'
  },
  {
    beautify: false
  }))
  .pipe(gulp.dest("./dest"));
```


## API
### jeditor(editorObject, [jsBeautifyOptions], [deepmergeOptions])
#### editorObject
Type: `JSON object`

JSON object to merge with.

#### jsBeautifyOptions
Type: `object`

This object is passed to js-beautify as its option.

#### deepmergeOptions
Type: `object`

This object is passed to deepmerge as its [option](https://github.com/TehShrike/deepmerge#options).

### jeditor(editorFunction, [jsBeautifyOptions], [deepmergeOptions])
#### editorFunction
Type: `function`

The `editorFunction` must have the following signature: `function (json) {}`, and must return JSON object.

#### jsBeautifyOptions
Type: `object`

This object is passed to js-beautify as its option.

#### deepmergeOptions
Type: `object`

This object is passed to deepmerge as its [option](https://github.com/TehShrike/deepmerge#options).

## License

Copyright (c) 2021 rejas

Licensed under the [MIT license](LICENSE).
