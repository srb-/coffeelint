path = require 'path'
vows = require 'vows'
assert = require 'assert'
coffeelint = require path.join('..', 'lib', 'coffeelint')


vows.describe('ensure_named_args').addBatch({

    'Named args' :

        topic : '''
            y++
            ++y
            x--
            --x
            '''

        'are permitted by default' : (source) ->
            console.log 'hereerer in test!!!!'


            errors = coffeelint.lint(source)
            assert.isArray(errors)
            assert.isEmpty(errors)

        'can be forbidden' : (source) ->
            errors = coffeelint.lint(source, {ensure_named_args: {'level':'error'}})
            assert.isArray(errors)
            assert.lengthOf(errors, 4)
            error = errors[0]
            assert.equal(error.lineNumber, 1)
            assert.equal(error.rule, 'ensure_named_args')

}).export(module)
