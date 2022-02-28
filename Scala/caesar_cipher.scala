object CaesarCipher 
{
    // Main Method 
    def main(args: Array[String]): Unit = {
        val cipherStr = "DUDE"
        val originalStr = cipherStr
        val shift = 4

        val ciphered = CaesarCipher.encrypt(cipherStr, 10)
        println("Decrypted Cipher Value: " + ciphered)

        val de_ciphered = CaesarCipher.decrypt(ciphered, 10)
        println("Encrypted Cipher Value: " + de_ciphered)

        CaesarCipher.solve(cipherStr, shift)
    }


    def encrypt(toCipher: String, shift: Int): String = {
        val newShift = shift % 26
        val charArray = toCipher.toUpperCase().toCharArray()
        val ciphered: String = ""

        for (i <- charArray) {
            if (i.toInt == 32) {
                ciphered += " ";
            }
            else {
                var temp = (i.toInt - 65 + shift) % 26
                if (temp < 0) {
                    temp += 26
                }
                ciphered += (temp + 65).toChar
            }
        }

        return ciphered
    }


    def decrypt(ciphered: String, shift: Int): String = {
        return encrypt(ciphered, (shift * -1))
    }


    def solve(cipherStr: String, maxShift: Int): Unit = {
        for(i <- 0 to maxShift) {
            println("Caesar " + i + ": " + encrypt(cipherStr, i))
        }
    }
}
