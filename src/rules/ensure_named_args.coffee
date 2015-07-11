
module.exports = class EnsureNamedArgs

    rule:
        name: 'ensure_named_args'
        level : 'ignore'
        message : 'STEVE'
        description: """

                STEVEE
            This rule is disabled by default.
            """

    #tokens: [ "++", "--" ]
    tokens: ['CALL_END']


            ### OK... algorithm...
            #  find arguments of function
            #  how to iterate through them

            when to activate?...

            DOING great!!!
            next step is to stop at CALL_START

            wicked... so need a routine, that for every comma,
            looks for an equal sign!

            #
            ###



    lintToken : (token, tokenApi) ->
        console.log '\n\nIN rule!!!\n'
        #console.log token # search backwards to see if we find an =?
        # throw new Error('MY RULE1!!')
        #console.log tokenApi.peek(-1)
        #console.log tokenApi.peek(-2)

        for i in [-1..-20] by -1
            t = tokenApi.peek(i)
            break if not t?
            break if t[0] is 'CALL_START'
            console.log t[0]

        # loop
        #     t = tokenApi.peek(i)

        #     if not t? or (t[0] is 'CALL_START'

        return {context : "found '#{token[0]}'"} # if it finds ++, then reports it, which is a fail
