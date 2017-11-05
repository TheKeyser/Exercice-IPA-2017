;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Afficheur 7 (Exercice 1)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (afficher a b c d)
  (cond
    ((and (equal? a #f) (equal? b #f) (equal? c #f) (equal? d #f)) (write "0")) ;0000 = 0
    ((and (equal? a #f) (equal? b #f) (equal? c #f) (equal? d #t)) (write "1")) ;0001 = 1
    ((and (equal? a #f) (equal? b #f) (equal? c #t) (equal? d #f)) (write "2")) ;0010 = 2
    ((and (equal? a #f) (equal? b #f) (equal? c #t) (equal? d #t)) (write "3")) ;0011 = 3
    ((and (equal? a #f) (equal? b #t) (equal? c #f) (equal? d #f)) (write "4")) ;0100 = 4
    ((and (equal? a #f) (equal? b #t) (equal? c #f) (equal? d #t)) (write "5")) ;0101 = 5
    ((and (equal? a #f) (equal? b #t) (equal? c #t) (equal? d #f)) (write "6")) ;0110 = 6
    ((and (equal? a #f) (equal? b #t) (equal? c #t) (equal? d #t)) (write "7")) ;0111 = 7
    ((and (equal? a #t) (equal? b #f) (equal? c #f) (equal? d #t)) (write "8")) ;1000 = 8
    (else (write "E")))
  )
(afficher #f #t #t #t)

(define  (affiche a b c d)
  (let* (
        (true1 (lambda (i) (if (equal? i #t) 1 0))) ;; on rend 1 si #t et 0 sinon
        (e (+ (* (true1 a) 8) (* (true1 b) 4) (* (true1 c) 2) (* (true1 d) 1)))) ;; comme il s'agit de code binaire on peut juste sommer tout les terme par leur puissance de deux respective
    (if (> e 9) ;; on vérifie juste si e est inferieur a 9 pour rendre E dans ce cas
        (display "E")
        (display e)))) 
(affiche #t #t #t #t)
        