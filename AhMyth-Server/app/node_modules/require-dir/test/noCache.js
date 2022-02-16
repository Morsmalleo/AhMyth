var assert = require("assert");
var requireDir = require("..");
var fs = require("fs");

var cachedResult = {
  a: "a",
  b: "b"
};

var notCachedResult = {
  a: "c",
  b: "b"
};

// filter the results to a particular file:
assert.deepEqual(requireDir("./noCache", { noCache: false }), cachedResult);

var promiseFileModification = new Promise(function(resolve, reject) {
  fs.writeFile("test/noCache/a.js", "module.exports = 'c';", "ascii", function(
    error
  ) {
    if (error) {
      reject(error);
    } else {
      resolve();
    }
  });
});

promiseFileModification.then(
  function() {
    // Check if cache is active that it is the same result
    assert.deepEqual(requireDir("./noCache", { noCache: false }), cachedResult);

    // Check by removing cache that the result is the new content
    assert.deepEqual(
      requireDir("./noCache", { noCache: true }),
      notCachedResult
    );

    console.log("noCache tests passed.");

    fs.writeFile(
      "test/noCache/a.js",
      "module.exports = 'a';",
      "ascii",
      function(error) {
        if (error) {
          console.error("noCache tests, issue to reset test.");
          console.error(error);
        }
      }
    );
  },
  function(error) {
    console.error("noCache tests failed.");
    console.error(error);
  }
);
