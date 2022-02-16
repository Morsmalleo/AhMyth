var assert = require('assert');
var requireDir = require('..');

var mapper = function(v, f) {
  return f.toUpperCase();
};

// first test without recursing:
assert.deepEqual(requireDir('./recurse', { mapKey: mapper }), {
    A: 'a',
});

// then test with recursing:
assert.deepEqual(requireDir('./recurse', { recurse: true, mapKey: mapper }), {
    A: 'a',
    B: {
        '1': {
            FOO: 'foo',
            BAR: 'bar',
        },
        '2': {}     // note how the directory is always returned
    },
    C: {
        '3': 3
    },
    // note that node_modules was explicitly ignored
});

console.log('mapKey tests passed.');
