var through = require('through');
var path = require('path');
var gutil = require('gulp-util');
var File = gutil.File;
var PluginError = gutil.PluginError;

function concatFilenames(filename, opts) {
    'use strict';

    function identity(x) {
        return x;
    }

    var error = {
        noFilename: 'Missing fileName option for gulp-concat-filenames',
        badTemplate: 'Error in template function'
    };

    opts = opts || {};
    opts.template = opts.template || identity;

    if (!filename) {
        throw new PluginError('gulp-concat-filenames', error.noFilename);
    }

    if (typeof opts.newLine !== 'string') {
        opts.newLine = gutil.linefeed;
    }

    var buffer = [],
        firstfile;

    function bufferContents(file) {
        firstfile = firstfile || file;

        var requirePath = path.resolve(file.path);

        // Make sure template errors reach the output
        var safeTemplate = function(str) {
            var output;
            try {
                output = opts.template(str);
            } catch (e) {
                e.message = error.badTemplate + ': ' + e.message;
                return this.emit('error', new PluginError('gulp-concat-filenames', e));
            }

            if (typeof output !== 'string') {
                return this.emit('error', new PluginError('gulp-concat-filenames', error.badTemplate));
            }
            return output;
        };

        requirePath = opts.root ?
            path.relative(opts.root, requirePath) :
            requirePath;

        var thisRequire = [
            opts.prepend || '',
            safeTemplate.call(this, requirePath.replace(/\\/g, '\/')),
            opts.append || '',
            opts.newLine
        ].join('');

        buffer.push(new Buffer(thisRequire));
    }

    function endStream() {
        if (buffer.length === 0) {
            return this.emit('end');
        }

        var outFileContents = Buffer.concat(buffer),
            outFilePath = path.join(firstfile.base, filename);

        var outFile = new File({
            cwd: firstfile.cwd,
            base: firstfile.base,
            path: outFilePath,
            contents: outFileContents
        });

        this.emit('data', outFile);
        this.emit('end');
    }

    return through(bufferContents, endStream);
}

module.exports = concatFilenames;
