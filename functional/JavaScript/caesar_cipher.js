function shifter(char, shift) {
  let ciphered_char = " ";
  if(char.trim() != '') {
    if (char === char.toUpperCase()) {
      ciphered_char = String.fromCharCode(((char.charCodeAt(0) - 65 + shift) % 26) + 65);
    }
    else {
      ciphered_char = String.fromCharCode(((char.charCodeAt(0) - 65 + shift) % 26) + 65);
    }
  }
  return ciphered_char;
}


function encrypt(toCipher, shift) {
    const toCipher_arr = toCipher.split('');
    let shiftAmt = shift % 26;
    const ciphered_arr = toCipher_arr.map(char => shifter(char, shiftAmt));
    var ciphered = ciphered_arr.join("");
    
    console.log(ciphered);
    return ciphered;
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

console.log("Welcome to Caesar Ciphers with JavaScript!");

// Call Caesar Cipher Encryption Method
var ciphered = encrypt(cipherStr, shift);
console.log("Encrypted Cipher Value: " + ciphered);

// Call Caesar Cipher Decryption Method
var deciphered = decrypt(ciphered, shift);
console.log("Decrypted Cipher Value: " + deciphered);

// Call Caesar Cipher Solve Method
//solve("DUDE", 26);