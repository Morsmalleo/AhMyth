process.env['NODE_ENV'] = 'development'

fs    = require 'fs'
path  = require 'path'
gulp  = require 'gulp'
tap   = require '../'
tapTest = require 'tap'


# helper function to get a path relative to the root
getPath = (rel) -> path.resolve __dirname, '..', rel

identity = (x) -> x


tapTest.test "throw errors", (test) ->

	test.plan 2

	gulp.src getPath 'tests/fixtures/' + 'js.js'
	.pipe tap (file, t) ->
		test.throws t.through.bind(null, gulp.dest, "wrong"), new TypeError("Args must be an array to `apply` to the filter")

	gulp.src getPath 'tests/fixtures/' + 'js.js'
		.pipe tap (file, t) ->
			test.throws t.through.bind(null, identity, ["right"]), {}, "should throw if supplied function doesn't return a stream'"

### Giving up due to lack of knowledge about vinyl-fs streams - I don't know how to get them to emit an error
tapTest.test "emit errors from stream errors", (test) ->

	test.plan 1

	gulp.src getPath 'tests/fixtures/' + 'js.js'
		.pipe tap (file, t) ->
			test.doesNotThrow t.through.bind(null, gulp.src, ['non-existing.txt'])###
