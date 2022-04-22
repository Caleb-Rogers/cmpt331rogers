object CaesarCipher {

    def shifter(base: String, char: Char, shift: Int) = {
        (base.toInt + ((char.toInt − base.toInt + offset) % 26)).toChar
    }


    def encrypt(toCipher: String, shift: Int): toCipher.map = {
        // Uppercase
		case char if char isUpper => shifter(’A’, char, shift) 
        // Lowercase
		case char if char isLower => shifter(’a’, char, shift)
        // Other (like space)
		case char => char
	}


    def decrypt(ciphered: String, shift: Int): encrypt(ciphered, -shift)


    def solve(cipher: String, shift: Int) : Unit = {
	    if (maxShift > 0) {
		    println("Caesar " + shift + ": " + encrypt(cipher, shift)) solve(cipher, (shift-1))
	    }
        else{
		    println("Caesar 0: " + cipher)
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
