-module(db).
-author("Kevin P. Downs").

-export([match/2, read/2, delete/2, write/3, destroy/1, new/0]).

new() -> [].

destroy(_Db) -> ok.

write(Key, Element, Db) ->
	Db ++ [{Key, Element}].

delete(_Key, []) ->
	[];
delete(Key, [{SearchKey, _SearchValue}|Xs]) -> 
	case (Key == SearchKey) of
		true -> Xs ++ delete(Key, Xs);
		false -> Xs
	end.

match(_Value, []) -> [];
match(Value, [{SearchKey, SearchValue}|Xs]) ->
	case (Value == SearchValue) of
		true -> [SearchKey] ++ match(Value, Xs);
		false -> match(Value, Xs)
	end.

read(_Key, []) -> {error, instance};
read(Key, [{SearchKey, SearchValue}|Xs]) -> 
	case (Key == SearchKey) of
		true -> {ok, SearchValue};
		false -> read(Key, Xs)
	end.


