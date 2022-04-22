object CaesarCipher {

    def shifter(char: Char, shift: Int) = {
        //(base.toInt + ((char.toInt − base.toInt + offset) % 26)).toChar
        if((char.toInt+shift) <= 90) {
            print((char.toInt+shift).toChar);
        } 
        else {
            var overflow: Int = 64 + ((char.toInt+shift - 90)
            print(overflow.toChar)
        }
    }

    def encrypt(toCipher: String, shift: Int) = {
        toCipher = toCipher.toUpperCase()
        shift = shift % 26
	    toCipher.map(char => shifter(char, shift))
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
        //var deciphered = decrypt(ciphered, shift)
        //println("Decrypted Cipher Value: " + deciphered)
      
        // Call Caesar Cipher Solve Method
        //solve("DUDE", 26)
    }
}
