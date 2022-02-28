program Hello;
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


begin
  cipherStr := 'DUDE';

  cipherStr := encrypt(cipherStr, 4);
  Writeln('Encrypted Cipher Value: ' + cipherStr);

  cipherStr := decrypt(cipherStr, 4);
  Writeln('Decrypted Cipher Value: ' + cipherStr);

  solve(cipherStr, 26);
end.