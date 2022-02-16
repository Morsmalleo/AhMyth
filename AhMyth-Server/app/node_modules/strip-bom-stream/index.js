'use strict';
const firstChunk = require('first-chunk-stream');
const stripBomBuf = require('strip-bom-buf');

module.exports = () =>
	firstChunk({chunkLength: 3}, (err, chunk, enc, cb) => {
		if (err) {
			cb(err);
			return;
		}

		cb(null, stripBomBuf(chunk));
	});
