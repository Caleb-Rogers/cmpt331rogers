##
## Name: Caleb Rogers
## CaesarCipher.py
##
## Purpose:
## Caesar Cipher that utilizes shift variable that determines the amount that characters are shifted.
##
## Inputs:
## 1. String to be encrypted
## 2. Number to shift with
##
## Output:
## Encrypted string
##
## Reference:
## https://www.tutorialspoint.com/cryptography_with_python/cryptography_with_python_caesar_cipher.htm
## https://www.geeksforgeeks.org/caesar-cipher-in-cryptography/
##

# Encryption Phase with shift n:
# E_n(x)=(x+n)mod\ 26

# Decryption Phase with shift n:
# D_n(x)=(x-n)mod\ 26


def main():
    print()
    print("Welcome to Caesar Ciphers with Python!!")
    originalTxt = input("Enter a string to be encrypted: ")
    shift = input("Enter a number to shift with: ")
    encryptedTxt = encrypt(originalTxt, shift)

    print("Plain Text : " + originalTxt)
    print("Shift pattern : " + shift)
    print("Cipher: " + encryptedTxt)


def encrypt(text,s):
    result = ""
    # transverse the plain text
    for i in range(len(text)):
        char = text[i]
        # Encrypt uppercase characters in plain text
        
        if (char.isupper()):
            result += chr((ord(char) + int(s)-65) % 26 + 65)
        # Encrypt lowercase characters in plain text
        else:
            result += chr((ord(char) + int(s) - 97) % 26 + 97)
    return result


main()
