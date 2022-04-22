(defun shifter(char shift)
  (if (= (char-code char) 32) (code-char 32)
    (code-char (+ (mod (+ (- (char-code char) 65) shift) 26) 65))))


(defun encrypt (toCipher shift)
  ;(map 'string #'(lambda (char) (shifter char shift)) toCipher))

)


(defun decrypt (ciphered shift) (encrypt ciphered (- shift)))


(defun solve (cipher shift) 
  (loop for i from 0 to shift
    do (format t "Caesar ~D: ~a~%" i (encrypt cipher i))))


;; Main Function
(defun main()
    ; Initialization
    (setq cipherStr "Dude Wheres My Car")
    (setq shift 4)

    (print ("Welcome to Caesar Ciphers with LISP!"))

    ; Call Caesar Cipher Encryption Method
    (setq ciphered (encrypt cipherStr shift))
    ;(format t "Encrypted Cipher Value: ~a ~%" ciphered)
    (format t "Encrypted Cipher Value: ~a" ciphered)

    ; Call Caesar Cipher Decryption Method
    ;;(setq deciphered (encrypt ciphered shift))
    ;;(format t "Encrypted Cipher Value: ~a ~%" deciphered)
        
    ; Call Caesar Cipher Solve Method
    ;;(solve "DUDE" 26))