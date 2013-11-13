-module(pi_calc).
-export([calculate/0]).

calculate() ->
    A = step(0.000000001, 1.0),
    B = A * (0.000000001 / 2.0),
    4.0 * B.

step(X, Y) ->
    if
      X < 1.0 ->
        step(X + 0.000000001, Y + 2.0 * math:sqrt(1.0 - (X * X)));
      true ->
        Y
    end.
main(_) ->
    PI = pi_calc:calculate(),
    io:write(PI).
