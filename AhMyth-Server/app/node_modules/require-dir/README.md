[![Build Status](https://travis-ci.org/aseemk/requireDir.svg?branch=master)](https://travis-ci.org/aseemk/requireDir)
[![npm version](https://badge.fury.io/js/require-dir.svg)](http://badge.fury.io/js/require-dir)

# requireDir()

Node helper to `require()` directories. The directory's files are examined,
and each one that can be `require()`'d is `require()`'d and returned as part
of a hash from that file's basename to its exported contents.

## Example

Given this directory structure:

```
dir
+ a.js
+ b.json
+ c.coffee
+ d.txt
```

`requireDir('./dir')` will return the equivalent of:

```js
{
  a: require('./dir/a.js'),
  b: require('./dir/b.json')
}
```

If CoffeeScript is registered via `require('coffee-script/register')`,
`c.coffee` will also be returned. Any extension registered with node will work the same way without any additional configuration.

## Installation

```
npm install require-dir
```

Note that this package is *not* `requireDir` — turns out that's already
[taken](https://github.com/JamesEggers1/node-requiredir)! ;)

## Usage

Basic usage that examines only directories' immediate files:

```js
var requireDir = require('require-dir');
var dir = requireDir('./path/to/dir');
```

You can optionally customize the behavior by passing an extra options object:

```js
var dir = requireDir('./path/to/dir', { recurse: true });
```

## Options

`recurse`: Whether to recursively `require()` subdirectories too.
(`node_modules` within subdirectories will be ignored.)
Default is false.

`filter`: Apply a filter on the filename before require-ing. For example, ignoring files prefixed with `dev` in a production environment:

```js
requireDir('./dir', {
  filter: function (fullPath) {
    return process.env.NODE_ENV !== 'production' && !fullPath.match(/$dev/);
  }
})
```

`mapKey`: Apply a transform to the module base name after require-ing. For example, uppercasing any module names:

```js
requireDir('./dir', {
  mapKey: function (value, baseName) {
    return baseName.toUpperCase();
  }
})
```

`mapValue`: Apply a transform to the value after require-ing. For example, uppercasing any text exported:

```js
requireDir('./dir', {
  mapValue: function (value, baseName) {
    return typeof value === 'string' ? value.toUpperCase() : value;
  }
})
```

`duplicates`: By default, if multiple files share the same basename, only the
highest priority one is `require()`'d and returned. (Priority is determined by
the order of `require.extensions` keys, with directories taking precedence
over files if `recurse` is true.) Specifying this option `require()`'s all
files and returns full filename keys in addition to basename keys.
Default is false.

In the example above, if there were also an `a.json`, the behavior would
be the same by default, but specifying `duplicates: true` would yield:

```js
{
  a: require('./dir/a.js'),
  'a.js': require('./dir/a.js'),
  'a.json': require('./dir/a.json'),
  b: require('./dir/b.json'),
  'b.json': require('./dir/b.json')
}
```

`noCache`: Prevent file caching. Could be useful using gulp.watch or other watch requiring refreshed file content Default is false.

```js
requireDir('./dir', { noCache: true })
```

`extensions`: Array of extensions to look for instead of using `require.extensions`.

```js
requireDir('./dir', { extensions: ['.js', '.json'] })
```

## Tips

Make an `index.js` in a directory with this code to clean things up:

```js
module.exports = require('require-dir')();   // defaults to '.'
```

And don't worry, the calling file is always ignored to prevent infinite loops.
