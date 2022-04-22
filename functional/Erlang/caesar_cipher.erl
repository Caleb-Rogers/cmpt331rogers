-module(prog).
-export([shifter/2, encrypt/2, decrypt/2, solve/2, main/0]).


shifter(Char, Shift) when (Char /= " ") ->
	                Ascii = fun([Ch]) -> Ch end,
	                (((Ascii(Char) - 65 + Shift) rem (26) + 26) rem 26) + 65;
shifter(Char, _Shift) ->
                    % whitespace
                    Char.


encrypt(ToCipher, Shift) ->
    Ciphered = lists:map(fun(Char) -> shifter([string:to_upper(Char)], Shift) end, ToCipher),
	io:format("Cipher Value: ~s~n", [Ciphered]).

decrypt(Ciphered, Shift) ->
    encrypt(Ciphered, (Shift * -1)).

solve(Cipher, 0) ->
    io:format("~s~n", [string:concat("Caesar 0: ",string:to_upper(Cipher))]);
solve(Cipher, _Shift) when Shift > 0 -> 
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
