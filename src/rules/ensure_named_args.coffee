
module.exports = class EnsureNamedArgs

    rule:
        name: 'ensure_named_args'
        level : 'error'
        message : 'Function called without naming each argument'
        description: """
            This rule prohibits calling a function without first naming each argument.
            """

    tokens: ['CALL_START']

    # return true if error found
    lintToken : (token, tokenApi) ->
        #console.log '\n\nIN rule!!!, return true if error is found\n'

        callStarts = 0
        argsWithoutName = 0
        i = 1

        done = false
        allArgumentsNamed = true

        while(not done)

            token = tokenApi.peek(i)?[0]
            #console.log token
            if not token? then done = true


            if callStarts is 0
                # We are not in any embedded function calls, so valid

                if token is 'CALL_END'
                    allArgumentsNamed = if argsWithoutName is 0 then true else false
                    done = true
                else
                    argsWithoutName++ if i is 1 # corner case for single argument
                    argsWithoutName++ if token is ','
                    argsWithoutName-- if token is '='


            # skip over recursive call starts - linter will get it later
            callStarts++ if token is 'CALL_START'
            callStarts-- if token is 'CALL_END'

            i = i + 1

        #console.log not allArgumentsNamed
        #return not allArgumentsNamed # if false then error
        if not allArgumentsNamed
            return { context: "#{argsWithoutName} argument(s) not named" }
        else
            return null




  # COOL way of doing desctructuring, and error assignment!!

  # lintToken: (token, tokenApi) ->
  #   {forbidden} = tokenApi.config[@rule.name]

  #   # Determine the token's original keyword.
  #   [type, value, pos] = token
  #   line = tokenApi.lines[tokenApi.lineNumber]
  #   keyword = line[pos.first_column..pos.last_column]

  #   # Error if the keyword is in the rules.forbidden hash.
  #   if keyword of forbidden
  #     replacement = forbidden[keyword]
  #     error =
  #       message: if replacement?
  #         "The \"#{keyword}\" keyword is forbidden. Use \"#{replacement}\" instead"
  #       else
  #         "The \"#{keyword}\" keyword is forbidden"
  #     return error
  #   return





        # true means it was found


        #console.log token # search backwards to see if we find an =?
        # throw new Error('MY RULE1!!')
        #console.log tokenApi.peek(-1)
        #console.log tokenApi.peek(-2)


        # for i in [-1..-20] by -1
        #     t = tokenApi.peek(i)
        #     break if not t?
        #     break if t[0] is 'CALL_START'
        #     console.log t[0]

        # loop
        #     t = tokenApi.peek(i)

        #     if not t? or (t[0] is 'CALL_START'

        #return {context: "found '#{token[0]}'"} # if it finds ++, then reports it, which is a fail




        ### OK... algorithm...
        #  find arguments of function
        #  how to iterate through them

        when to activate?...

        DOING great!!!
        next step is to stop at CALL_START

        wicked... so need a routine, that for every comma,
        looks for an equal sign!

        so use a stack, push with every comma, pop with every equals

        do it recursively, because could have function calls in func calls


        #
        ###


    # recursiveCheckArgs: (i, tokenApi) ->

    #     token = tokenApi.peek(i)?[0]
    #     argCountStack = 0

    #     while(token? and token is not 'CALL_END')

    #         argCountStack++ if token is ','
    #         argCountStack-- if token is '='

    #         if token is 'CALL_START'
    #             i = recursiveCheckArgs(i + 1, tokenApi)

    #         i = i + 1
    #         token = tokenApi.peek(i)?[0]


    #     if argCountStack not 0 then return -1 else return i
