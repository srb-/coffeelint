
module.exports = class EnsureNamedArgs

    rule:
        name: 'ensure_named_args'
        level : 'ignore'
        message : 'STEVE'
        description: """

                STEVEE
            This rule is disabled by default.
            """

    tokens: [ "++", "--" ]


            ### OK... algorithm...
            #  find arguments of function
            #  how to iterate through them

            when to activate?...
            #
            ###



    lintToken : (token, tokenApi) ->
        console.log 'IN RULE!!!'
        # throw new Error('MY RULE1!!')
        return {context : "found '#{token[0]}'"}
