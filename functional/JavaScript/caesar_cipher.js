function shifter(char, shift) {
  if(char.trim() === '') {
    console.log("space: " + char);
  }
  else {
    let code = char.charCodeAt(0);

    if (char === char.toUpperCase()) {
      console.log("upper: " + char);
      console.log(String.fromCharCode(((char.charCodeAt(0) - 65 + shift) % 26) + 65));
    }
    else {
      console.log("lower: " + char);
      console.log(String.fromCharCode(((char.charCodeAt(0) - 97 + shift) % 26) + 97));
    }
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
//decrypt(ciphered, shift);

// Call Caesar Cipher Solve Method
//solve("DUDE", 26);