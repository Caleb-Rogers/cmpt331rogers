object CaesarCipher {

    var cipherStr = ""
    
    def shifter(char: Char, shift: Int) = {
        // Account for uppercase letters
        if (char >= 'A' && char <= 'Z') {
            // If no whitespace, shift character
            if(!(char.isWhitespace)) {
                print((((char.toInt + shift - 65) % 26).toInt + 65).toChar.toString())
                this.cipherStr += (((char.toInt + shift - 65) % 26).toInt + 65).toChar.toString()
            }
            // Else whitespace, append space 
            else {
                print(" ")
                this.cipherStr += (" ")
            }
        }
        // Account for lowercase letters
        else {
            if(!(char.isWhitespace)) {
                print((((char.toInt + shift - 97) % 26).toInt + 97).toChar.toString())
                this.cipherStr += (((char.toInt + shift - 65) % 26).toInt + 65).toChar.toString()
            }
            else {
                print(" ")
                this.cipherStr += (" ")
            }
        }
    }


    def encrypt(toCipher: String, shift: Int) = {
        var shiftAmt: Int = shift % 26
        toCipher.map(char => shifter(char, shiftAmt))
	}


    def decrypt(shift: Int) = {
		encrypt(this.cipherStr, (-shift))
	}


    def solve(cipher: String, shift: Int): Unit = {
        println("Caesar " + shift + ": " + encrypt(cipher, shift))
        if(shift > 0) {
            solve(cipher, shift-1)
        }
    }

    
    def main(args: Array[String]): Unit = {
        
        // Initialization
        var cipherStr = "Dude Wheres My Car"
        var shift = 4
        
        println("Welcome to Caesar Ciphers with Scala!")
        
        // Call Caesar Cipher Encryption Method
        print("Encrypted Cipher Value: ")
        encrypt(cipherStr, shift)
        println("")
  
        // Call Caesar Cipher Decryption Method
        print("Decrypted Cipher Value: ")
        decrypt(shift)
        println("")
      
        // Call Caesar Cipher Solve Method
        solve("DUDE", 26)
    }
}
