var fs             = require('fs');
var path           = require('path');
var less           = require('less');
var through2       = require('through2');
var replaceExt     = require('replace-ext');
var assign         = require('object-assign');
var applySourceMap = require('vinyl-sourcemaps-apply');
var PluginError    = require('plugin-error');

function inlineSources(map) {
  if (map.sourcesContent) {
    return Promise.resolve(map);
  }

  return Promise.all(
    map.sources.map(function (source) {
      return new Promise(function (resolve, reject) {
        fs.readFile(source, 'utf8', function (err, data) {
          if (err) {
            reject(err);
          } else {
            resolve(data);
          }
        });
      });
    })
  ).then(
    function (contents) {
      map.sourcesContent = contents;
      return map;
    },
    function () {
      return map;
    }
  );
}

function renderLess(str, opts) {
  return new Promise(function (resolve, reject) {
    less.render(str, opts, function (err, res) {
      if (err) {
        reject(err);
      } else {
        var obj = {
          result: res.css,
          imports: res.imports,
        };
        if (opts.sourceMap && res.map) {
          obj.sourcemap = JSON.parse(res.map);
          inlineSources(obj.sourcemap).then(function (map) {
            obj.sourcemap = map;
            resolve(obj);
          });
        } else {
          resolve(obj);
        }
      }
    });
  });
}

module.exports = function (options) {
  // Mixes in default options.
  var opts = assign({}, {
    compress: false,
    paths: []
  }, options);

  return through2.obj(function (file, enc, cb) {
    if (file.isNull()) {
      return cb(null, file);
    }

    if (file.isStream()) {
      return cb(new PluginError('gulp-less', 'Streaming not supported'));
    }

    var str = file.contents.toString();

    // Injects the path of the current file
    opts.filename = file.path;

    // Bootstrap source maps
    if (file.sourceMap || opts.sourcemap) {
      opts.sourceMap = true;
    }

    renderLess(str, opts).then(function(res) {
      file.contents = Buffer.from(res.result);
      file.path = replaceExt(file.path, '.css');
      if (res.sourcemap) {
        res.sourcemap.file = file.relative;
        res.sourcemap.sources = res.sourcemap.sources.map(function (source) {
          return path.relative(file.base, source);
        });

        applySourceMap(file, res.sourcemap);
      }
      return file;
    }).then(function(file) {
      cb(null, file);
    }).catch(function(err) {
      // Convert the keys so PluginError can read them
      err.lineNumber = err.line;
      err.fileName = err.filename;

      // Add a better error message
      err.message = err.message + ' in file ' + err.fileName + ' line no. ' + err.lineNumber;
      return cb(new PluginError('gulp-less', err));
    });
  });
};
