function encrypt(toCipher, shift) {

    // recursive call
    if (shift < 0) {
        return encrypt(toCipher, (shift+26))
    }

    var ciphered = "";
    for (var i=0; i<toCipher.length; i++) {
        var char = toCipher[i];

        // skip if not a letter
        if (char.match(/[a-z]/i)) {
            var ascii = toCipher.charCodeAt(i);
            // shift if Uppercase
            if ((ascii >= 65) && (ascii <= 90)) {
                char = String.fromCharCode(((ascii - 65 + shift) % 26) + 65);
            }
            // shift if Lowercase
            else if ((ascii >= 97) && (ascii <= 122)) {
                char = String.fromCharCode(((ascii - 97 + shift) % 26) + 97);
            }
        }
        ciphered += char;
    }

    return ciphered;
}


function decrypt(ciphered, shift) {
    encrypt(ciphered, -shift);
}


function solve(cipher, shift) {
    
}


/** Main **/
// Initialization
cipherStr = "Dude Wheres My Car";
shift = 4;

console.log("Welcome to Caesar Ciphers with JavaScript!");

// Call Caesar Cipher Encryption Method
encrypt(cipherStr, shift);

// Call Caesar Cipher Decryption Method
decrypt(cipherStr, shift);

// Call Caesar Cipher Solve Method
solve("DUDE", 26);