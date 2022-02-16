'use strict';

var log = require('fancy-log');
var exec = require('child_process').exec;
var escape = require('any-shell-escape');

module.exports = function (remote, opt, cb) {
  if (!cb && typeof opt === 'function') {
    // optional options
    cb = opt;
    opt = {};
  }
  if (!remote || typeof remote !== 'string') {
    var error = new Error('gulp-git: remote is required git.removeRemote("origin")');
    if (!cb || typeof cb !== 'function') throw error;
    return cb(error);
  }
  if (!cb || typeof cb !== 'function') cb = function () {};
  if (!opt) opt = {};
  if (!opt.cwd) opt.cwd = process.cwd();
  if (!opt.args) opt.args = ' ';

  var maxBuffer = opt.maxBuffer || 200 * 1024;

  var cmd = 'git remote remove ' + opt.args + ' ' + escape([remote]);
  return exec(cmd, {cwd: opt.cwd, maxBuffer: maxBuffer}, function(err, stdout, stderr) {
    if (err) return cb(err);
    if (!opt.quiet) log(stdout, stderr);
    cb();
  });
};
