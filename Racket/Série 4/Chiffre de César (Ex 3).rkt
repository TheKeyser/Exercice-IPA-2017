;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Chiffre de César (Ex 3)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; on définit un fonction shift qui remplace une lettre par une lettre a la distance clé

(define (shift char cle)
  (let* ((nb (char->integer char)))
        (integer->char (+ nb cle))))
;; on definit ensuite une fonction césar qui code un message
(define (cesar msg cle) (cesar_aux msg cle 0))
(define (cesar_aux msg cle i)
  (if (= i (- (string-length msg) 1))
      (display (shift (string-ref msg i) cle))
      (begin (display (shift (string-ref msg i) cle)) (cesar_aux msg cle (+ i 1)))))
(display "cesar=")
(cesar "racketpue" 15)
(display " cesar2=")
(define (cesar2 msg cle)
  (display (list->string (map(lambda (x) (shift x cle)) (string->list msg)))))

(cesar2 "rendezvousamidi" 3)