-module(prog).
-export([shifter/2, encrypt/2, decrypt/2, solve/2, main/0]).


shifter(Char, Shift) when (Char /= " ") ->
                    % if a char, then shift
	                Ascii = fun([Ch]) -> Ch end,
	                (((Ascii(Char) - 65 + Shift) rem (26) + 26) rem 26) + 65.
shifter(Char, _Shift) ->
                    % otherwise, whitespace
                    Char.


encrypt(ToCipher, Shift) ->
    % functionally map each character to shifter method
    Ciphered = lists:map(fun(Char) -> shifter([string:to_upper(Char)], Shift) end, ToCipher),
    Ciphered.

decrypt(Ciphered, Shift) ->
    Ciphered = encrypt(Ciphered, -Shift).

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
