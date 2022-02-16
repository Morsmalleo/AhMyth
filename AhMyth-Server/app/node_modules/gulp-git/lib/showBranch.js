'use strict';

var log = require('fancy-log');
var exec = require('child_process').exec;

module.exports = function (opt, cb) {
  if (!cb && typeof opt === 'function') {
    // optional options
    cb = opt;
    opt = {};
  }
  if (!cb || typeof cb !== 'function') cb = function () {};
  if (!opt) opt = {};
  if (!opt.cwd) opt.cwd = process.cwd();
  if (!opt.args) opt.args = ' ';

  var cmd = 'git show-branch ' + opt.args;
  return exec(cmd, {cwd: opt.cwd}, function(err, stdout, stderr) {
    if (err) return cb(err);
    if (!opt.quiet) log(stdout, stderr);
    cb(null, stdout);
  });
};
