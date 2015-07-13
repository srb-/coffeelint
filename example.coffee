
# To test run:
#
# coffeelint example.coffee --rules src/rules/ensure_named_args.coffee


fn1 = (x) ->
  x + 3

fn2 = (y, x) ->
  x + 4
  y - 3

fn2(x = 33, mod = fn1(y = 'bob'))
