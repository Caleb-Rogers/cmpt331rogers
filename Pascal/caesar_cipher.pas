program CaesarCipher(output);

  var cipherStr: String;
  var shift : Integer;

function encrypt(toCipher: String; shift:Integer): String;
  var
    i, temp: Integer;
    toUpperStr: String;
  begin
    toUpperStr := UpCase(toCipher);
    for i := 1 to length(toUpperStr) do
    
    begin
      temp := (byte(toUpperStr[i]) - 65 + shift) mod Integer(26);
      if (temp < 0) then
        begin
          temp := temp + 26;
        end;
      temp := temp + 65;

      if (byte(toUpperStr[i]) = 32) then
        begin
          temp := 32;
        end;
      toUpperStr[i] := chr(temp);
    end;

    encrypt := toUpperStr;
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