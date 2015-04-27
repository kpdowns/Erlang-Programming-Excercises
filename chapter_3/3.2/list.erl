-module(list).
-author("Kevin P. Downs").

-export([create/1, reverse_create/1]).

create(N) when N < 0 ->
	{error, no_elements};
create(N) when N >= 0, is_integer(N) ->
	create(N, []);
create(_) ->
	{error, invalid_input}.

create(N, List) when N > 0 ->
	create(N - 1, [N | List]);
create(_, List) ->
	List.

reverse_create(N) when is_integer(N)-> 
	reverse_create(N, 0, []).

reverse_create(N, M, List) when M < N ->
    Next = M + 1, 
    reverse_create(N, Next, [Next | List]);
reverse_create(_, _, List) -> 
	List.