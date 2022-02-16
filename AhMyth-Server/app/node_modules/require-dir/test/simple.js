var assert = require('assert');
var requireDir = require('..');

// first test regularly:
assert.deepEqual(requireDir('./simple'), {
    a: 'a',
    b: 'b',
});

// now register CoffeeScript and do it again:
// note that CoffeeScript shouldn't be used by any other tests! we can't rely
// on ordering of tests, and require.extensions and require.cache are global.
require('coffee-script/register');
assert.deepEqual(requireDir('./simple'), {
    a: 'a',
    b: 'b',
    c: 'c',
});

// now register TypeScript and do it again:
// note that we include typescript files but not declarations.
require('ts-node/register');
assert.deepEqual(requireDir('./simple'), {
    a: 'a',
    b: 'b',
    c: 'c',
    e: 'e',
});

console.log('Simple tests passed.');
