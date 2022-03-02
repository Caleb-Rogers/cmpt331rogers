object CaesarCipher {
    def encrypt(toCipher: String, shift: Int): String = {
		var ciphered: String = "";
		
        for(i <- 0 to (toCipher.length() - 1)) {
			if (toCipher.charAt(i) >= 'A' && toCipher.charAt(i) <= 'Z') {
				ciphered = ciphered + (((toCipher.charAt(i).toInt + shift - 65) % 26).toInt + 65).toChar.toString();
			}
			else {
				ciphered = ciphered + (((toCipher.charAt(i).toInt + shift - 97) % 26).toInt + 97).toChar.toString();
			}
		}
		return ciphered;
	}


    def decrypt(ciphered: String, shift: Int): String = {
        return encrypt(ciphered, (shift * -1))
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
        var ciphered = encrypt(cipherStr, 10)
        println("Encrypted Cipher Value: " + ciphered)
  
        // Call Caesar Cipher Decryption Method
        var deciphered = decrypt(ciphered, 10)
        println("Decrypted Cipher Value: " + deciphered)
      
        // Call Caesar Cipher Solve Method
        solve("DUDE", 26)
    }
}
