program CaesarCipher(output);

  var cipherStr: String;
  var shift : Integer;

function encrypt(toCipher: String; shift: Integer): String;
  var
    i: Integer;
  begin
    for i := 1 to length(toCipher) do
      case toCipher[i] of
        'A'..'Z': toCipher[i] := chr(ord('A') + (ord(toCipher[i]) - ord('A') + shift) mod 26);
        'a'..'z': toCipher[i] := chr(ord('a') + (ord(toCipher[i]) - ord('a') + shift) mod 26);
      end;
    encrypt := toCipher;
  end;


function decrypt(ciphered: String; shift: Integer): String;
  begin
    decrypt := encrypt(ciphered, (shift * -1));
  end;


procedure solve(cipher: String; shift: Integer);
  var
    i: Integer;
  begin
    for i := 0 to shift do
      begin
        Writeln('Caesar ', i, ': ', encrypt(cipher, i));
      end;
  end;


// basically main
begin
  // Initialization
  cipherStr := 'Dude Wheres My Car';
  shift := 4;

  Writeln('Welcome to Caesar Ciphers with Pascal!');
  
  // Call Caesar Cipher Encryption Method
  cipherStr := encrypt(cipherStr, shift);
  Writeln('Encrypted Cipher Value: ' + cipherStr);
  
  // Call Caesar Cipher Decryption Method
  cipherStr := decrypt(cipherStr, shift);
  Writeln('Decrypted Cipher Value: ' + cipherStr);
  
  // Call Caesar Cipher Solve Method
  solve('DUDE', 26);
end.