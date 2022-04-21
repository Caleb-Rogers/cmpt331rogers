-module(caesar_cipher2).
-export([encrypt/2, decrypt/2, solve/2, main/0]).

encrypt(Str, ShftAmt) ->
    io:fwrite("Encrypt...\n").

decrypt(Str, ShftAmt) ->
    io:fwrite("Decrypt...\n").

solve(Str, MaxShftAmt) ->
    io:fwrite("Solve...\n").


%% Main Function
main() ->
    % Initialization
    CipherStr = "the quick brown fox jumped over the lazy dog",
	Shift = 4,

    io:fwrite("Welcome to Caesar Ciphers with Erlang!\n").

    % Call Caesar Cipher Encryption Method
    encrypt(CipherStr, Shift),

    % Call Caesar Cipher Decryption Method
	decrypt(CipherStr, Shift),
	
    % Call Caesar Cipher Solve Method
    solve("DUDE", 26).
