var assert = require('assert');
var requireDir = require('..');

// filter the results to a particular file:
assert.deepEqual(requireDir('./simple', { filter: function (filename) { return filename.match(/a\.js$/); } }), {
    a: 'a'
});

console.log('Filter tests passed.');
