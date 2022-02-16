'use strict'

baseStream = require('stream')
through = require('through2')

DEBUG = process.env.NODE_ENV is 'development'


###
# Taps into the pipeline and allows user to easily route data through
# another stream or change content.
###
module.exports = (lambda) ->
  utils = (tapStream, file) ->

    ###
    # Routes through another stream. The filter must not be
    # created. This will create the filter as needed.
    #
    # @param filter {stream}
    # @param args {Array} Array containg arguments to apply to filter.
    #
    # @example
    #   t.through coffee, [{bare: true}]
    ###
    through: (filter, args) ->

      if DEBUG
        if not Array.isArray(args)
          throw new TypeError("Args must be an array to `apply` to the filter")

      stream = filter.apply(null, args)
      stream.on "error", (err) ->
        tapStream.emit "error", err

      # Use original stream pipe file when emit `end/data` event
      # stream.pipe tapStream

      stream.write file
      stream

  modifyFile = (file, enc, cb) ->
    inst = file: file
    obj = lambda(inst.file, utils(this, inst.file), inst)

    next = () =>
      this.push(file)
      cb()

    # if user returned a stream
    # passthrough when the stream is ended
    if obj instanceof baseStream and not obj._readableState.ended

      obj.on('end', next)
      obj.on('data', data = ->
        obj.removeListener 'end', next
        obj.removeListener 'data', data
        next())
    else
      next()

  return through.obj(modifyFile, (cb) -> cb())
