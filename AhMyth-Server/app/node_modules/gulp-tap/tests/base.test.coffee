fs    = require 'fs'
path  = require 'path'
gulp  = require 'gulp'
tap   = require '../'
tapTest = require 'tap'


# helper function to get a path relative to the root
getPath = (rel) -> path.resolve __dirname, '..', rel


tapTest.test "change file.base twice will end with 'Error: no writecb in Transform classh' #5", (test) ->

    test.plan 1

    fixturePath = getPath 'tests/fixtures/'

    gulp.src fixturePath + '/js.js'
      .pipe tap (file) ->
        file.old_base = file.base
        file.base += 'random-path/'
      .pipe tap (file) ->
        file.base = file.old_base
      .pipe tap (file) ->
        test.ok true
        test.end()
