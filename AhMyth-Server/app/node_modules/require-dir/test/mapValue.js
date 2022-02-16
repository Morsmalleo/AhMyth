var assert = require('assert');
var requireDir = require('..');

var mapper = function(v, f) {
  if (typeof v === 'string') return v.toUpperCase();
  return v;
};

// first test without recursing:
assert.deepEqual(requireDir('./recurse', { mapValue: mapper }), {
    a: 'A',
});

// then test with recursing:
assert.deepEqual(requireDir('./recurse', { recurse: true, mapValue: mapper }), {
    a: 'A',
    b: {
        '1': {
            foo: 'FOO',
            bar: 'BAR',
        },
        '2': {}     // note how the directory is always returned
    },
    c: {
        '3': 3
    },
    // note that node_modules was explicitly ignored
});

console.log('mapValue tests passed.');
