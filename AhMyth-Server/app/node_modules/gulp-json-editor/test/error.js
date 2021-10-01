var json   = require('../');
var fs     = require('fs');
var File   = require('vinyl');
var should = require('should');

it('should raise error when missing option', function(done) {
  should(function() {json();}).throw('missing "editor" option');
  done();
});


it('should raise error when invalid type of option', function(done) {
  should(function() {json(1);})
    .throw('"editor" option must be a function or object');
  done();
});


it('should do path-through when input is null', function(done) {
  json({})
    .on('data',  function(file) {
      should(file.contents).eql(null);
      done();
    })
    .write(new File({}));
});


it('should raise error when streaming input', function(done) {
  json({})
    .on('error', function(err) {
      err.message.should.equal('Streaming is not supported');
      done();
    })
    .write(new File({
      contents: fs.createReadStream('test/test.json'),
    }));
});
