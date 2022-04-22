object CaesarCipher {

    def shifter(char: Char, shift: Int) = {
        if (char.toInt + shift <= 90) {
            print((char.toInt + shift).toChar)
        }
        else if (char.toInt - shift >= 65) {
            print((char.toInt - shift).toChar);
        }
    }


    def encrypt(toCipher: String, shift: Int): String = {
		var input:String = toCipher.toUpperCase()
	    var shiftAmt:Int = shift % 26
	    input.map(x => shifter(x, shiftAmt))
	}


    def decrypt(ciphered: String, shift: Int): String = {
		var input:String = ciphered.toUpperCase()
	    var shiftAmt:Int = shift % 26
	    input.map(x => shifter(x, shiftAmt))
	}


    def solve(cipherStr: String, loop: Int): Unit = {
        /*
        for(i <- 0 to loop) {
            println("Caesar " + i + ": " + encrypt(cipherStr, i))
        }
        */
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
