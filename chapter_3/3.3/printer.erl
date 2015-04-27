-module(printer).
-author("Kevin P. Downs").

-export([print_nums/1, print_even_nums/1]).

print_nums(N) when is_integer(N), N > 0 ->
	print_helper(1, N).

print_helper(Cur, N) when Cur < N ->
	io:format("Number: ~p~n", [Cur]),
	print_helper(Cur + 1, N);
print_helper(Cur, N) when Cur =:= N ->
	io:format("Number: ~p~n", [Cur]).

print_even_nums(N) when N >= 2 ->
	print_even_helper(1, N).
	
print_even_helper(Cur, N) when Cur rem 2 == 0, Cur < N ->
	io:format("Number: ~p~n", [Cur]),
	print_even_helper(Cur + 1, N);
print_even_helper(Cur, N) when Cur < N->
	print_even_helper(Cur + 1, N);
print_even_helper(Cur, N) when Cur =:= N ->
	io:format("Number: ~p~n", [Cur]).