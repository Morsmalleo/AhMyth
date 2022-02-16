'use strict';

var concatFilenames = require('../index.js'),
    chai = require('chai'),
    sinonChai = require('sinon-chai'),
    expect = chai.expect,
    assert = require('stream-assert'),
    File = require('gulp-util').File,
    gulp = require('gulp'),
    path = require('path');

chai.use(sinonChai);

function fixtures(glob) {
    return path.join(__dirname, 'fixtures', glob);
}

describe('Given gulp-concat-filenames', function () {
    describe('When I do not provide a filename', function () {
        it('Then it should error', function () {

            function nofilenameProvided() {
                concatFilenames();
            }

            expect(nofilenameProvided)
                .to
                .throw(Error, 'Missing fileName option for gulp-concat-filenames');
        });
    });

    describe('When I do provide a filename', function () {
        it('Then it should support null files', function (done) {
            var expectedFilenames = ([
                    path.join(__dirname, 'fixtures/fork.txt'),
                    path.join(__dirname, 'fixtures/knife.js'),
                    path.join(__dirname, 'fixtures/spoon.html'),
                ]
                    .join('\n') + '\n')
                .replace(/\\/g, '\/')
                .toString();

            gulp
                .src(fixtures('*'), {
                    read: false
                })
                .pipe(concatFilenames('example.js'))
                .pipe(assert.first(function (d) {

                    var contents = d.contents.toString();
                    expect(contents)
                        .to
                        .equal(expectedFilenames);
                }))
                .pipe(assert.end(done));
        });

        it('Then it support streamed files', function (done) {
            var expectedFilenames = ([
                    path.join(__dirname, 'fixtures/fork.txt'),
                    path.join(__dirname, 'fixtures/knife.js'),
                    path.join(__dirname, 'fixtures/spoon.html'),
                ]
                    .join('\n') + '\n')
                .replace(/\\/g, '\/')
                .toString();

            gulp
                .src(fixtures('*'), {
                    buffer: false
                })
                .pipe(concatFilenames('example.js'))
                .pipe(assert.first(function (d) {

                    var contents = d.contents.toString();
                    expect(contents)
                        .to
                        .equal(expectedFilenames);
                }))
                .pipe(assert.end(done));
        });

        describe('When I do not provide the "root" optional argument', function () {
            it('then it will concatinate all filenames into a single file with absolute paths', function (done) {
                var expectedFilenames = ([
                        path.join(__dirname, 'fixtures/fork.txt'),
                        path.join(__dirname, 'fixtures/knife.js'),
                        path.join(__dirname, 'fixtures/spoon.html'),
                    ]
                        .join('\n') + '\n')
                    .replace(/\\/g, '\/')
                    .toString();

                gulp
                    .src(fixtures('*'))
                    .pipe(concatFilenames('mainfest.txt'))
                    .pipe(assert.first(function (d) {

                        var contents = d.contents.toString();
                        expect(contents)
                            .to
                            .equal(expectedFilenames);
                    }))
                    .pipe(assert.end(done));
            });
        });

        describe('When I do  provide the "root" optional argument', function () {
            it('then it will concatinate all filenames into a single file with relative paths', function (done) {
                var expectedFilenames = ([
                        '../test/fixtures/fork.txt',
                        '../test/fixtures/knife.js',
                        '../test/fixtures/spoon.html',
                    ].join('\n') + '\n').toString();

                gulp
                    .src(fixtures('*'))
                    .pipe(concatFilenames('mainfest.txt', {
                        root: 'fixtures'
                    }))
                    .pipe(assert.first(function (d) {

                        var contents = d.contents.toString();
                        expect(contents)
                            .to
                            .equal(expectedFilenames);
                    }))
                    .pipe(assert.end(done));
            });

            describe('When I provide prepend and append arguments', function () {
                it('then it will concatinate all filenames into a single file with prefix and suffix strings', function (done) {
                    var expectedFilenames = ([
                        'XXX../test/fixtures/fork.txtYYY',
                        'XXX../test/fixtures/knife.jsYYY',
                        'XXX../test/fixtures/spoon.htmlYYY',
                    ].join('\n') + '\n').toString();

                    gulp
                        .src(fixtures('*'))
                        .pipe(concatFilenames('mainfest.txt', {
                            root: 'fixtures',
                            prepend: 'XXX',
                            append: 'YYY'
                        }))
                        .pipe(assert.first(function (d) {

                            var contents = d.contents.toString();
                            expect(contents)
                                .to
                                .equal(expectedFilenames);
                        }))
                        .pipe(assert.end(done));
                });
            });

            describe('When I provide a differnt newLine argument', function () {

                it('then it will concatinate all filenames into a single file with an alternate newLine', function (done) {
                    var expectedFilenames = ([
                        '../test/fixtures/fork.txt',
                        '../test/fixtures/knife.js',
                        '../test/fixtures/spoon.html',
                    ].join('XXX') + 'XXX').toString();

                    gulp
                        .src(fixtures('*'))
                        .pipe(concatFilenames('mainfest.txt', {
                            root: 'fixtures',
                            newLine: 'XXX'
                        }))
                        .pipe(assert.first(function (d) {

                            var contents = d.contents.toString();
                            expect(contents)
                                .to
                                .equal(expectedFilenames);
                        }))
                        .pipe(assert.end(done));
                });
            });

            describe('When I provide a formatting function', function () {

                it('then it will apply that function to each entry', function (done) {
                    var expectedFilenames = ([
                        'XXX../test/fixtures/fork.txtYYY',
                        'XXX../test/fixtures/knife.jsYYY',
                        'XXX../test/fixtures/spoon.htmlYYY',
                    ].join('\n') + '\n').toString().toUpperCase();

                    gulp
                        .src(fixtures('*'))
                        .pipe(concatFilenames('mainfest.txt', {
                            root: 'fixtures',
                            template: function(filename) {
                                return 'XXX' + filename.toUpperCase() + 'YYY';
                            }
                        }))
                        .pipe(assert.first(function (d) {

                            var contents = d.contents.toString();
                            expect(contents)
                                .to
                                .equal(expectedFilenames);
                        }))
                        .pipe(assert.end(done));
                });
            });

            describe('When I provide a formatting function with a syntax error', function () {

                it('then it will fail and throw an error', function (done) {
                    gulp
                        .src(fixtures('*'))
                        .pipe(concatFilenames('mainfest.txt', {
                            root: 'fixtures',
                            template: function(filename) {
                                /* jshint ignore:start */
                                y = 0; // deliberate syntax error
                                /* jshint ignore:end */
                                return filename;
                            }
                        }))
                        .on('error', function (err) {
                            expect(err.message).to.have.string('Error in template function');
                            done();
                        });
                });
            });

            describe('When I provide a formatting function that does not return a string', function () {

                it('then it will fail and throw an error', function (done) {
                    gulp
                        .src(fixtures('*'))
                        .pipe(concatFilenames('mainfest.txt', {
                            root: 'fixtures',
                            template: function() {
                                return 5;
                            }
                        }))
                        .on('error', function (err) {
                            expect(err.message).to.equal('Error in template function');
                            done();
                        });
                });
            });
        });
    });
});
