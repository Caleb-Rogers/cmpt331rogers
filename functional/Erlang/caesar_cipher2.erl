-module(prog).
-export([encrypt/2, decrypt/2, solve/2, main/0]).


offset(Char,Key) when (Char >= $A) and (Char =< $Z) or
                   (Char >= $a) and (Char =< $z) ->
  Offset = $A + Char band 32,
  N = Char - Offset,
  Offset + (N + Key) rem 26;
offset(Char, _Key) ->
  Char.

encrypt(ToCipher, Shift) ->
    lists:map(fun(Char) -> offset(Char, Shift) end, ToCipher).

decrypt(Ciphered, Shift) ->
    encrypt(Ciphered, -Shift).

solve(Cipher, 0) ->
 	io:format("~s~n", [string:concat("Caesar 0: ",string:to_upper(Cipher))]);
solve(Cipher, Shift) when Shift > 0 -> 
	io:format("~s~n", [lists:concat(["Caesar ", Shift, ": ", encrypt(Cipher, Shift)])]),
	solve(Cipher, (Shift-1)).


%% Main Function
main() ->
    % Initialization
    CipherStr = "Dude Wheres My Car",
	Shift = 4,

    io:fwrite("Welcome to Caesar Ciphers with Erlang!\n"),

    % Call Caesar Cipher Encryption Method
    encrypt(CipherStr, Shift),

    % Call Caesar Cipher Decryption Method
	decrypt(CipherStr, Shift),
	
    % Call Caesar Cipher Solve Method
    solve("DUDE", 26).