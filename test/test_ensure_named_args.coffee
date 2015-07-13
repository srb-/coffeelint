path = require 'path'
vows = require 'vows'
assert = require 'assert'
coffeelint = require path.join('..', 'lib', 'coffeelint')


vows.describe('ensure_named_args').addBatch({

    'Named args':

        topic : '''
            fn(result = fn2(ycoord = 33, xcoord = fn3()))
        '''
        ###



            fn('text')
            fn(msg = 'text')
            fn(99, msg = 'text')
            fn(num = 99, msg = 'text', 'bob')
            fn(num = 99, msg = 'text', name = 'bob')

            console.log('this should fail')
            console.log(msg = 'this should pass')
            console.log('this should fail too', 999)
            fn1(fn2('test'))
            fn1(fn2(msg = 'test'))
            fn1(translatedMsg = fn2(msg = 'test'))
            '''###

        'are permitted by default' : (source) ->
            #console.log 'hereerer in test!!!!'


            errors = coffeelint.lint(source)
            assert.isArray(errors)
            assert.isEmpty(errors)

        'can be forbidden' : (source) ->
            console.log 'Return TRUE if error'
            errors = coffeelint.lint(source, {ensure_named_args: {'level':'error'}})
            assert.isArray(errors)
            assert.lengthOf(errors, 2) # works on number of errors given topics test above
            error = errors[0]
            assert.equal(error.lineNumber, 1)
            assert.equal(error.rule, 'ensure_named_args')

}).export(module)
