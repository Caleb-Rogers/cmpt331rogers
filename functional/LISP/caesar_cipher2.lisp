(defun offset (ch key)
  (let* ((c  (char-code  ch)) (la (char-code #\a)) (ua (char-code #\A)) 
        (base (cond ((<= la c (char-code #\z)) la) 
                    ((<= ua c (char-code #\Z)) ua) 
                    (nil))))
        (if base (code-char (+ (mod (+ (- c base) key) 26) base)) ch)))

(defun encrypt (str key)
  (map 'string #'(lambda (c) (offset c key)) str))

(defun decrypt (str key) (encrypt str (- key)))

(defun solve (str num) 
  (loop for n from 0 to num
    do (format t "Caesar ~D: ~a~%" n (encrypt str n))))


(let* ((cipherStr "Dude Wheres My Car")
      (shift 4)
      (ciphered (encrypt cipherStr shift))
      (deciphered (decrypt ciphered shift)))

  (format t "Welcome to Caesar Ciphers with LISP! ~%")
  (format t "Encrypted Cipher Value: ~a ~%" ciphered)
  (format t "Decrypted Cipher Value: ~a ~%" deciphered)
  (solve "DUDE" 26))