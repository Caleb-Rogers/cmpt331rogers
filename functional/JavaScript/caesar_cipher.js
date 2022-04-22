function shifter(char, shift) {
  let ciphered_char = " ";
  // skip if whitespace
  if(char.trim() != '') {
    // Handle if Uppercase
    if (char === char.toUpperCase()) {
      ciphered_char = String.fromCharCode(((char.charCodeAt(0) - 65 + shift) % 26) + 65);
    }
    // Handle if Lowercase
    else {
      ciphered_char = String.fromCharCode(((char.charCodeAt(0) + shift - 97) % 26) + 97);
    }
  }
  return ciphered_char;
}


function encrypt(toCipher, shift) {
    const toCipher_arr = toCipher.split('');
    let shiftAmt = shift % 26;
    // functionally map each character to shifter method
    const ciphered_arr = toCipher_arr.map(char => shifter(char, shiftAmt));
    var ciphered = ciphered_arr.join("");
    return ciphered;
}


function decrypt(ciphered, shift) {
    var negativeShift = (26 - shift)
    return encrypt(ciphered, negativeShift)
}


function solve(cipher, shift) {
  console.log("Caesar " + shift + ": " + encrypt(cipher, shift));
  if (shift > 0) {
    solve(cipher, shift-1)
  }
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
solve("DUDE", 26);