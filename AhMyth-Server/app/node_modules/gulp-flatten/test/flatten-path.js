var should = require('should');
var path = require('path');
var flattenPath = require('../lib/flatten-path');
var fileInstance;

describe('gulp-flatten', function () {

  beforeEach(function () {
    fileInstance = {
      base: '/some/project/src/',
      path: '/some/project/src/top1/top2/bottom2/bottom1/app.css',
      relative: 'top1/top2/bottom2/bottom1/app.css'
    };
  });

  describe('includeParents', function () {
    it('should keep top parent dirs from indludeParents option', function (done) {
      var topOnly = flattenPath(fileInstance, {includeParents: 1});
      topOnly.should.equal('top1/app.css');

      done();
    });

    it('should keep bottom parent dirs from indludeParents option', function (done) {
      var bottomOnly = flattenPath(fileInstance, {includeParents: [0, 1]});
      bottomOnly.should.equal('bottom1/app.css');

      done();
    });

    it('should treat negative number in indludeParents as bottom parent levels', function (done) {
      var bottomOnly = flattenPath(fileInstance, {includeParents: -1});
      bottomOnly.should.equal('bottom1/app.css');

      done();
    });

    it('should keep top and bottom parent dirs from indludeParents option', function (done) {
      var both = flattenPath(fileInstance, {includeParents: [1, 2]});
      both.should.equal('top1/bottom2/bottom1/app.css');

      done();
    });

    it('should pick relative path if indludeParents bottom+top too long', function (done) {
      var relative = flattenPath(fileInstance, {includeParents: [10, 10]});
      relative.should.equal(fileInstance.relative);

      done();
    });
  });

  describe('subPath', function () {
    it('should keep top parent dirs from subPath option', function (done) {
      var topOnly = flattenPath(fileInstance, {subPath: [0, 2]});
      topOnly.should.equal('top1/top2/app.css');

      done();
    });

    it('should keep bottom parent dirs from subPath option', function (done) {
      var bottomOnly = flattenPath(fileInstance, {subPath: -2});
      bottomOnly.should.equal('bottom2/bottom1/app.css');

      done();
    });

    it('should keep top2 and bottom2 from subPath option', function (done) {
      var middleOnly = flattenPath(fileInstance, {subPath: [1, -1]});
      middleOnly.should.equal('top2/bottom2/app.css');

      done();
    });
  });
});
