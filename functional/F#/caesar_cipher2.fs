open System

let private encrypt toCipher shiftAmt =
        let shift c =
            if Char.IsLetter c then
                let a = (if Char.IsLower c then 'a' else 'A') |> int
                (int c - a + toCipher) % 26 + a |> char
            else c
        String.map shift shiftAmt

let private decrypt ciphered shiftAmt =
        (encrypt ciphered -shiftAmt)

let private solve cipher shiftAmt =
        //  ...
    

(* Main Function *)
let main() =
    // Initialization
    let cipherStr = "Dude Wheres My Car"
    let shift = 4

    Console.WriteLine("Welcome to Caesar Ciphers with F#!")

    // Call Caesar Cipher Encryption Method
    Console.WriteLine("Encrypted Cipher Value: {0}", (encrypt cipherStr shift))

    // Call Caesar Cipher Decryption Method
    Console.WriteLine("Decrypted Cipher Value: {0}", (decrypt cipherStr shift))

    // Call Caesar Cipher Solve Method
    (solve "DUDE" 26)

main()