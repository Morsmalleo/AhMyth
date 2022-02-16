'use strict';

var log = require('fancy-log');
var exec = require('child_process').exec;
var escape = require('any-shell-escape');
var revParse = require('./revParse');

module.exports = function (remote, branch, opt, cb) {

  if (!remote) remote = 'origin';

  function setBranch(cb2) {
    if (branch && typeof branch === 'function') {
      cb = branch;
      branch = null;
    }
    if (branch && Object.prototype.toString.call(branch) === '[object Object]') {
      opt = branch;
      branch = null;
    }
    if (!branch) {
      revParse({ args: '--abbrev-ref HEAD' },
        function callback(err, out) {
          if (err) return cb2(err);
          branch = out;
          cb2();
        });
    } else {
      cb2();
    }
  }

  function flush(err) {
    if (err) return cb(err);
    if (!cb && typeof opt === 'function') {
      cb = opt;
      opt = {};
    }
    if (!cb || typeof cb !== 'function') cb = function() {};
    if (!opt) opt = {};
    if (!opt.cwd) opt.cwd = process.cwd();
    if (!opt.args) opt.args = ' ';

    var cmd = 'git push ' + escape([].concat(remote, branch)) + ' ' + opt.args;
    var maxBuffer = opt.maxBuffer || 200 * 1024;

    return exec(cmd, {
      cwd: opt.cwd,
      maxBuffer: maxBuffer
    }, function(err, stdout, stderr) {
      if (err) return cb(err);
      if (!opt.quiet) log(stdout, stderr);
      cb();
    });
  }

  return setBranch(flush);

};
