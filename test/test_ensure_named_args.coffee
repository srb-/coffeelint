path = require 'path'
vows = require 'vows'
assert = require 'assert'
coffeelint = require path.join('..', 'lib', 'coffeelint')


vows.describe('ensure_named_args').addBatch({

    'Named args' :

        topic : '''
            fn()
            fn('text')
            fn(msg = 'text')
        '''
        ###
            console.log('this should fail')
            console.log(msg = 'this should pass')
            console.log('this should fail too', 999)
            fn1(fn2('test'))
            fn1(fn2(msg = 'test'))
            fn1(translatedMsg = fn2(msg = 'test'))
            '''###

        'are permitted by default' : (source) ->
            console.log 'hereerer in test!!!!'


            errors = coffeelint.lint(source)
            assert.isArray(errors)
            assert.isEmpty(errors)

        'can be forbidden' : (source) ->
            errors = coffeelint.lint(source, {ensure_named_args: {'level':'error'}})
            assert.isArray(errors)
            assert.lengthOf(errors, 3) # works on number of errors given topics test above
            error = errors[0]
            assert.equal(error.lineNumber, 1)
            assert.equal(error.rule, 'ensure_named_args')

}).export(module)
