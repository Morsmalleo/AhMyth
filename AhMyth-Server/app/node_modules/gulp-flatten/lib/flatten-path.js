var path = require('path');

function includeParents(dirs, opts) {
  var topLevels;
  var bottomLevels = 0;
  var topPath = [];
  var bottomPath = [];
  var newPath = [];

  if (Array.isArray(opts)) {
    topLevels = Math.abs(opts[0]);
    bottomLevels = Math.abs(opts[1]);
  } else if (opts >= 0) {
    topLevels = opts;
  } else {
    bottomLevels = Math.abs(opts);
  }

  if (topLevels + bottomLevels > dirs.length) {
    return dirs;
  }

  while (topLevels > 0) {
    topPath.push(dirs.shift());
    topLevels--;
  }
  while (bottomLevels > 0) {
    bottomPath.unshift(dirs.pop());
    bottomLevels--;
  }
  return topPath.concat(bottomPath);
}

function subPath(dirs, opts) {
  if (Array.isArray(opts)) {
    return dirs.slice(opts[0], opts[1]);
  } else {
    return dirs.slice(opts);
  }
}

/**
 * Flatten the path to the desired depth
 *
 * @param {File} file - vinyl file
 * @param {Object} options
 * @return {String}
 */
function flattenPath(file, opts) {
  var fileName = path.basename(file.path);
  var dirs;

  if (!opts.includeParents && !opts.subPath) {
    return fileName;
  }

  dirs = path.dirname(file.relative).split(path.sep);
  if (opts.includeParents) {
    dirs = includeParents(dirs, opts.includeParents);
  }
  if (opts.subPath) {
    dirs = subPath(dirs, opts.subPath);
  }

  dirs.push(fileName);
  return path.join.apply(path, dirs);
}

module.exports = flattenPath
