Sub Encrypt(toCipher As String, shift As Integer)
  Dim temp As Integer
  ' For Loop characters
  For i As Integer = 0 To Len(toCipher)
    ' Similar to switch statement
    Select Case As Const toCipher[i] 
      ' Account for upper case
      Case 65 To 90    
        temp = toCipher[i] + shift
        If temp > 90 Then temp -= 26
          toCipher[i] = temp
      ' Account for lower case
      Case 97 To 122
        temp = toCipher[i] + shift
        If temp > 122 Then temp -= 26
          toCipher[i] = temp
    End Select
  Next
End Sub


Sub Decrypt(ciphered As String, shift As Integer)
  Dim temp As Integer
  ' For Loop characters
  For i As Integer = 0 To Len(ciphered)
    Select Case As Const ciphered[i]
    ' Account for upper case
      Case 65 To 90    
        temp = ciphered[i] - shift
        If temp < 65 Then temp += 26
          ciphered[i] = temp
      ' Account for lower case
      Case 97 To 122
        temp = ciphered[i] - shift
        If temp < 97 Then temp += 26
          ciphered[i] = temp
    End Select
  Next
End Sub


Sub Solve(cipherStr As String, shift As Integer)
    For j As Integer = 1 To 26
        encrypt(cipherStr, shift)
        Print "Ceasar " ; j ; ": " ; cipherStr
    Next
End Sub


' Basically Main '
Cls
' Initialization
Dim cipherStr As String = "Dude Wheres My Car"
Dim shift As Integer = 4

Print "Welcome to Caesar Ciphers with BASIC!"
  
' Call Caesar Cipher Encryption Method
Encrypt cipherStr, shift
Print "Encrypted Cipher Value: "; cipherStr
  
' Call Caesar Cipher Decryption Method
Decrypt cipherStr, shift
Print "Decrypted Cipher Value: "; cipherStr
  
' Call Caesar Cipher Solve Method
Solve "DUDE", shift

Sleep