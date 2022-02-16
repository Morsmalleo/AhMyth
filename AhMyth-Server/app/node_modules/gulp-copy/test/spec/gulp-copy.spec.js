'use strict';

describe('Gulp Copy', function() {
    var gulpCopy = require('../../lib/gulp-copy');

    it('should exist', function() {
        expect(gulpCopy).toBeDefined();
    });

    it('should require a valid destination', function() {
        expect(function() {
            gulpCopy();
        }).toThrow();
        expect(function() {
            gulpCopy(null);
        }).toThrow();
        expect(function() {
            gulpCopy(1);
        }).toThrow();
        expect(function() {
            gulpCopy('');
        }).not.toThrow();
    });

    it('should require a valid options object', function() {
        expect(function() {
            gulpCopy('', 1);
        }).toThrow();
        expect(function() {
            gulpCopy('');
        }).not.toThrow();
        expect(function() {
            gulpCopy('', {});
        }).not.toThrow();
    });
});
