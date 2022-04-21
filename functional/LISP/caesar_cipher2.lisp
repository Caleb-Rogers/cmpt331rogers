(defun offset (ch shift)
  (let* ((c  (char-code  ch)) (la (char-code #\a)) (ua (char-code #\A)) 
         (base (cond ((<= la c (char-code #\z)) la) 
                     ((<= ua c (char-code #\Z)) ua) 
                     (nil))))
    (if base (code-char (+ (mod (+ (- c base) shift) 26) base)) ch)))
 

(defun encrypt (toCipher shift)
  (map 'string #'(lambda (char) (offset char shift)) toCipher))


(defun decrypt (ciphered shift) (encrypt ciphered (- shift)))


(defun solve (cipher shift) 
  (loop for i from 0 to shift
    do (format t "Caesar ~D: ~a~%" i (encrypt cipher i))))


;; Basically Main
; Initialization
(let ((cipherStr "Dude Wheres My Car"))
    (string-upcase cipherStr))
(let (shift 4))

(let ((str "Hello, world!"))
  (string-upcase str))

(print ("Welcome to Caesar Ciphers with LISP!"))

; Call Caesar Cipher Encryption Method
(let (ciphered (encrypt cipherStr shift)))
(format t "Encrypted Cipher Value: ~a ~%" ciphered)

; Call Caesar Cipher Decryption Method
(let (deciphered (decrypt ciphered shift)))
(format t "Encrypted Cipher Value: ~a ~%" deciphered)
	
; Call Caesar Cipher Solve Method
(solve "DUDE" 26)
