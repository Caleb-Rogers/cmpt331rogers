object CaesarCipher {
    def encrypt(toCipher: String, shift: Int): String = {
		var ciphered: String = "";
        for(i <- 0 to (toCipher.length() - 1)) {
                // Account for uppercase letters
                if (toCipher.charAt(i) >= 'A' && toCipher.charAt(i) <= 'Z') {
                    // If no whitespace, shift character
                    if(!((toCipher.charAt(i)).isWhitespace)) {
                        ciphered = ciphered + (((toCipher.charAt(i).toInt + shift - 65) % 26).toInt + 65).toChar.toString();
                    }
                    // Else whitespace, append space 
                    else {
                        ciphered = ciphered + toCipher.charAt(i);
                    }
                }
                // Account for lowercase letters
                else {
                    if(!((toCipher.charAt(i)).isWhitespace)) {
                        ciphered = ciphered + (((toCipher.charAt(i).toInt + shift - 97) % 26).toInt + 97).toChar.toString();
                    }
                    else {
                        ciphered = ciphered + toCipher.charAt(i);
                    }
                }
		}
		return ciphered;
	}


    def decrypt(ciphered: String, shift: Int): String = {
        // Shifts back to original
        var negativeShift: Int = (26 - shift)
        return encrypt(ciphered, negativeShift)
    }


    def solve(cipherStr: String, loop: Int): Unit = {
        for(i <- 0 to loop) {
            println("Caesar " + i + ": " + encrypt(cipherStr, i))
        }
    }
    
    def main(args: Array[String]): Unit = {
        
        // Initialization
        var cipherStr = "Dude Wheres My Car"
        var shift = 4
        
        println("Welcome to Caesar Ciphers with Scala!")
        
        // Call Caesar Cipher Encryption Method
        var ciphered = encrypt(cipherStr, shift)
        println("Encrypted Cipher Value: " + ciphered)
  
        // Call Caesar Cipher Decryption Method
        var deciphered = decrypt(ciphered, shift)
        println("Decrypted Cipher Value: " + deciphered)
      
        // Call Caesar Cipher Solve Method
        solve("DUDE", 26)
    }
}
