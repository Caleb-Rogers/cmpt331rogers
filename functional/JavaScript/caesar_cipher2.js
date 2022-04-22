function shifter(char, shift) {
    if (char == char.toUpperCase()) {
        console.log(String.fromCharCode(((char.charCodeAt(0) + shift) - 65) % 26) + 65);
        ciphered += String.fromCharCode(((char.charCodeAt(0) + shift - 65) % 26) + 65);
    }
    else {
        console.log(String.fromCharCode(((char.charCodeAt(0) + shift - 65) % 26) + 65));
        ciphered += String.fromCharCode(((char.charCodeAt(0) + shift - 97) % 26) + 97);
    }
}


function encrypt(toCipher, shift) {
    const toCipher_arr = toCipher.split('');
    let shiftAmt = shift % 26;
    const ciphered_arr = toCipher_arr.map(char => shifter(char, shiftAmt));
}


function decrypt(ciphered, shift) {
    encrypt(ciphered, -shift);
}


function solve(cipher, shift) {
    
}


/** Main **/
// Initialization
var cipherStr = "Dude Wheres My Car";
var shift = 4;
var ciphered = "";

console.log("Welcome to Caesar Ciphers with JavaScript!");

// Call Caesar Cipher Encryption Method
encrypt(cipherStr, shift);

// Call Caesar Cipher Decryption Method
decrypt(ciphered, shift);

// Call Caesar Cipher Solve Method
//solve("DUDE", 26);