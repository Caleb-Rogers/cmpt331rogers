object CaesarCipher {
    def encrypt(toCipher: String, shift: Int) = {
        var cipher: String = toCipher.toUpperCase()
        var shiftAmt: Int = shift % 26
        cipher.map(char => shifter(char, shiftAmt))
	}
    
    def shifter(char: Char, shift: Int) = {
        if(char.toInt + shift <= 90){
            print((char.toInt + shift).toChar);
        } 
        else {
            var overflow :Int = 64 + (char.toInt + shift - 90)
            print(overflow.toChar)
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
