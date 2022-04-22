(defun shifter(ch shift)
  ; prev formula for shift: charOf(ord('A') + (ord(char) - ord('A') + shift) mod 26)
	(if (= (char-code ch) 32) (code-char 32)
	    (code-char (+ (mod (+ (- (char-code ch) 65) shift) 26) 65))))

(defun encrypt (toCipher shift)
  ; use map to functionally call shift method for each character (uppercase first to make easy)
  (map 'string #'(lambda (char) (shifter char shift)) (string-upcase toCipher)))

(defun decrypt (ciphered shift) (encrypt ciphered (- shift)))

(defun solve (cipher shift) 
  (loop for i from 0 to shift
    do (format t "Caesar ~D: ~a~%" i (encrypt cipher i))))

;; Main ;;
; Initialization & Encryption & Decryption
(let* ((cipherStr "Dude Wheres My Car")
      (shift 4)
      (ciphered (encrypt cipherStr shift))
      (deciphered (decrypt ciphered shift)))

  ; Output results & call Solve
  (format t "Welcome to Caesar Ciphers with LISP! ~%")
  (format t "Encrypted Cipher Value: ~a ~%" ciphered)
  (format t "Decrypted Cipher Value: ~a ~%" deciphered)
  (solve "DUDE" 26)
)