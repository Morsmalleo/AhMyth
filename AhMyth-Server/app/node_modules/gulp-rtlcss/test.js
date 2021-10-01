(function() {
    'use strict';
    var assert = require('assert');
    var Vinyl = require('vinyl');
    var gulpRtlcss = require('./index');

    it('should convert LTR CSS to RTL', function (cb) {
        var stream = gulpRtlcss();

        stream.on('data', function (file) {
            assert.equal(file.contents.toString(), '.selector { float: right; /* comment */ }');
            cb();
        });

        stream.write(new Vinyl({
            path: 'styles.css',
            contents: Buffer.from('.selector { float: left; /* comment */ }')
        }));
    });

    it('should accept rtlcss configuration', function (cb) {
        var stream = gulpRtlcss({
            "options": {
                "preserveComments": true,
                "preserveDirectives": false,
                "swapLeftRightInUrl": true,
                "swapLtrRtlInUrl": true,
                "swapWestEastInUrl": true,
                "autoRename": false,
                "greedy": false,
                "enableLogging": false,
                "minify": false
            },
            "rules": [ ],
            "declarations": [ ],
            "properties": [ ],
            "map": false
        });

        stream.on('data', function (file) {
            assert.equal(file.contents.toString(), ".pull-left {content: ' ';}");
            cb();
        });

        stream.write(new Vinyl({
            path: 'styles.css',
            contents: Buffer.from(".pull-left {content: ' ';}")
        }));
    });

    it('should honour rtlcss directives', function (cb) {
        var stream = gulpRtlcss();

        stream.on('data', function (file) {
            assert.equal(file.contents.toString(), ".toRight {\n" +
                                                   "  text-align: left;\n" +
                                                   "}\n");
            cb();
        });

        stream.write(new Vinyl({
            path: 'styles.css',
            contents: Buffer.from(".toRight {\n" +
                                 "  /*rtl:remove*/\n" +
                                 "  direction: rtl;\n" +
                                 "  \n" +
                                 "  /*rtl:ignore*/\n" +
                                 "  text-align: left;\n" +
                                 "}\n")
        }));
    });
})();
