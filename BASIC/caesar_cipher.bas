Declare Function encrypt(toCipher As String, shift As Integer)
Declare Function decrypt(ciphered As String, shift As Integer)
Declare Function solve(cipherStr As String)

Cls
Dim toCipher As String
Dim shift As Integer
Dim ciphered As String
Dim cipherStr As String
toCipher = "DUDE"
shift = 4

ciphered = encrypt(toCipher, shift)
Print "Encrypted Cipher Value: " ; ciphered

cipherStr = decrypt(ciphered, shift)
Print "Decrypted Cipher Value: " ; cipherStr

solve(cipherStr)

Sleep
End


Function encrypt(toCipher As String, shift As Integer)
    Dim temp As Integer

    For i As Integer = 0 To Len(toCipher)
        Select Case As Const toCipher[i]
            Case 65 To 90
                temp = toCipher[i] + shift
                If temp > 90 Then temp -= 26
                    toCipher[i] = temp
            Case 97 to 122
                temp = text[i] + shift
                If temp > 122 Then temp -= 26
                    toCipher[i] = temp
        End Select
    Next

    return toCipher
End Function


Function decrypt(ciphered As String, shift As Integer)
    return encrypt(ciphered, shift)
End Function


Function solve(cipherStr As String)
    Dim ciphered As String
    For i As Integer = 0 to 25
        ciphered = encrypt(cipherStr, shift)
        Print "Ceasar " ; i ; ": " ; encrypt(cipherStr, i)
    Next
End Function