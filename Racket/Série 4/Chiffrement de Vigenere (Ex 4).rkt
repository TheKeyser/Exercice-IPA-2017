;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Chiffrement de Vigenere (Ex 4)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (char_26 char)
   (let* ((nb (char->integer char)))
          (if (>= nb 97)
        (modulo (- nb 97) 26)
        (modulo (- nb 65) 26))))
(char_26 #\u)

(define (shift char_msg char_cle)
  (let* ((nb (char_26 char_msg))
         (cle (char_26 char_cle)))
        (integer->char (+ (modulo (+ nb cle) 26) 65))))
        
(shift #\u #\u)
(define (encrypt-Vigenere msg key) (encrypt-Vigenere-aide msg (list->string (genere-cle key msg 0)) 0))
(define (encrypt-Vigenere-aide msg key cpt)
  (if (= cpt (- (string-length msg) 1))
      (display (shift (string-ref msg cpt) (string-ref key cpt)))
      (begin (display (shift (string-ref msg cpt) (string-ref key cpt))) (encrypt-Vigenere-aide msg key (+ 1 cpt)))))

(define (genere-cle cle msg i)
  (if (= i (string-length msg))
      null
      (cons (string-ref cle (modulo i (string-length cle))) (genere-cle cle msg (+ 1 i)))))
  
(encrypt-Vigenere  "aaaaaaaa" "bcb")