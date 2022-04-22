object CaesarCipher {
    def encrypt(toCipher: String, shift: Int) = {
        var shiftAmt: Int = shift % 26
        toCipher.map(char => shifter(char, shiftAmt))
	}
    
    def shifter(char: Char, shift: Int) = {
        // Account for uppercase letters
        if (char >= 'A' && char <= 'Z') {
            // If no whitespace, shift character
            if(!(char.isWhitespace)) {
                print((((char.toInt + shift - 65) % 26).toInt + 65).toChar.toString());
            }
            // Else whitespace, append space 
            else {
                print(" ")
            }
        }
        // Account for lowercase letters
        else {
            if(!(char.isWhitespace)) {
                print((((char.toInt + shift - 97) % 26).toInt + 97).toChar.toString());
            }
            else {
                print(" ")
            }
        }
    }

    
    def main(args: Array[String]): Unit = {
        
        // Initialization
        var cipherStr = "Dude Wheres My Car"
        var shift = 4
        
        println("Welcome to Caesar Ciphers with Scala!")
        
        // Call Caesar Cipher Encryption Method
        encrypt(cipherStr, shift)
  
        // Call Caesar Cipher Decryption Method
        //var deciphered = decrypt(ciphered, shift)
        //println("Decrypted Cipher Value: " + deciphered)
      
        // Call Caesar Cipher Solve Method
        //solve("DUDE", 26)
    }
}
