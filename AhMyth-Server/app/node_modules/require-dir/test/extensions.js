var assert = require('assert');
var requireDir = require('..');

// first test regularly:
assert.deepEqual(requireDir('./simple'), {
    a: 'a',
    b: 'b',
});

// only js files
assert.deepEqual(requireDir('./simple', {extensions: ['.js']}), {
    a: 'a'
});

// both js and json files
assert.deepEqual(requireDir('./simple', {extensions: ['.js', '.json']}), {
    a: 'a',
    b: 'b'
});

// then test with recursing:
assert.deepEqual(requireDir('./recurse', {recurse: true, extensions: ['.js']}), {
    a: 'a',
    b: {
        '1': {
            foo: 'foo'
        },
        '2': {}     // note how the directory is always returned
    },
    c: {}
    // note that node_modules was explicitly ignored
});

console.log('Extensions tests passed.');
