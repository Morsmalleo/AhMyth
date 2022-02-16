'use strict';
/**
 * git
 * @exports gulp-git
 * @property {function} add             {@link module:gulp-git/lib/add}
 * @property {function} addRemote       {@link module:gulp-git/lib/addRemote}
 * @property {function} addSubmodule    {@link module:gulp-git/lib/addSubmodule}
 * @property {function} branch          {@link module:gulp-git/lib/branch}
 * @property {function} catFile         {@link module:gulp-git/lib/catFile}
 * @property {function} checkout        {@link module:gulp-git/lib/checkout}
 * @property {function} checkoutFiles   {@link module:gulp-git/lib/checkoutFiles}
 * @property {function} clean           {@link module:gulp-git/lib/clean}
 * @property {function} clone           {@link module:gulp-git/lib/clone}
 * @property {function} commit          {@link module:gulp-git/lib/commit}
 * @property {function} diff            {@link module:gulp-git/lib/diff}
 * @property {function} exec            {@link module:gulp-git/lib/exec}
 * @property {function} fetch           {@link module:gulp-git/lib/fetch}
 * @property {function} init            {@link module:gulp-git/lib/init}
 * @property {function} merge           {@link module:gulp-git/lib/merge}
 * @property {function} pull            {@link module:gulp-git/lib/pull}
 * @property {function} push            {@link module:gulp-git/lib/push}
 * @property {function} removeRemote    {@link module:gulp-git/lib/removeRemote}
 * @property {function} reset           {@link module:gulp-git/lib/reset}
 * @property {function} revParse        {@link module:gulp-git/lib/revParse}
 * @property {function} rm              {@link module:gulp-git/lib/rm}
 * @property {function} showBranch      {@link module:gulp-git/lib/showBranch}
 * @property {function} stash           {@link module:gulp-git/lib/stash}
 * @property {function} status          {@link module:gulp-git/lib/status}
 * @property {function} tag             {@link module:gulp-git/lib/tag}
 * @property {function} updateSubmodule {@link module:gulp-git/lib/updateSubmodule}
 */
var requireDir = require('require-dir');
module.exports = requireDir('./lib');
