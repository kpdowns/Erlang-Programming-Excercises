-module(arith).
-author("Kevin P. Downs").

-export([sum/1, sum/2]).

sum(N) ->
	accsum(lists:seq(1,N), 0).

sum(N, M) ->
	accsum(lists:seq(N, M), N).

accsum([X|Xs], Acc) ->
	X + accsum(Xs, Acc);
accsum([], _Acc) ->
	0.