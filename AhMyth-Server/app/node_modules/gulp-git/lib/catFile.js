'use strict';
/**
 * catFile
 * @module gulp-git/lib/catFile
 */

var through = require('through2');
var PluginError = require('plugin-error');
var spawn = require('child_process').spawn;
var stripBom = require('strip-bom-stream');

/**
 * get a buffer.
 * @callback requestCallback
 * @param {buffer} buf
 */

/**
 * Convert stream to buffer
 *
 * @param   {Stream} stream stream that what to read
 * @param   {readStreamCallback} callback function that receive buffer
 * @returns {void}
 */
function readStream(stream, callback) {
  var buf;
  stream.on('data', function(data) {
    if (buf) {
      buf = Buffer.concat([buf, data]);
    } else {
      buf = data;
    }
  });
  stream.once('finish', function() {
    if (buf) {
      callback(buf);
    }
  });
}

/**
 * @typedef {object}    catFileOptions
 * @property {boolean}  stripBOM {@link https://github.com/gulpjs/vinyl-fs#optionsstripbom}
 * @property {boolean}  buffer {@link https://github.com/gulpjs/vinyl-fs#optionsbuffer}
 */

/**
 * read vinyl file contents
 * @param {catFileOptions} opt [catFileOptions]{@link module:gulp-git/lib/catFile~catFileOptions}
 * @returns {stream}       stream of vinyl `File` objects.
 */
module.exports = function (opt) {
  if (!opt) opt = {};
  if (undefined === opt.stripBOM || null === opt.stripBOM) opt.stripBOM = true;
  if (undefined === opt.buffer || null === opt.buffer) opt.buffer = true;

  /**
   * transform function of stream {@link https://nodejs.org/docs/latest/api/stream.html#stream_transform_transform_chunk_encoding_callback}
   *
   * @param {vinyl}    file The file to be transformed.
   * @param {any}      enc  encoding type.
   * @param {function} cb   A callback function (optionally with an error argument and data) to be called after the supplied `file` has been processed.
   * @returns {void}
   */
  var write = function(file, enc, cb) {

    var hash = file.git && file.git.hash;

    /**
     * set file contents and send file to stream
     *
     * @param {Buffer} contents file contents
     * @returns {void}
     */
    var sendFile = function(contents) {
      if (contents) {
        file.contents = contents;
      }
      return cb(null, file);
    };

    if (!hash || /^0+$/.test(hash)) {
      return sendFile();
    }

    var catFile = spawn('git', ['cat-file', 'blob', hash], {
      cwd: file.cwd
    });

    var contents = catFile.stdout;
    var that = this;

    readStream(catFile.stderr, function(error) {
      that.emit('error', new PluginError('gulp-git', 'Command failed: ' + catFile.spawnargs.join(' ').trim() + '\n' + error.toString()));
    });

    if (opt.stripBOM) {
      contents = contents.pipe(stripBom());
    }

    if (opt.buffer) {
      readStream(contents, sendFile);
    } else {
      sendFile(contents);
    }
  };
  var stream = through.obj(write);
  return stream;
};
