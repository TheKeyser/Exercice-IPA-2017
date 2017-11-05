;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Recursivite (Exercice 2)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; la fonction begin
;; Partie sans (+ 2 1)
(+ (begin
(display 1)
(newline)
(display 2)
(newline)
(+ 2 1)
(newline)
5
) 1)
;; Partie avec (+ 2 1)
(+ (begin
(display 1)
(newline)
(display 2)
(newline)
(display (+ 2 1))
(newline)
5
) 1)

;; Compteur
;; on définit un compteur qui va de n a 0 et on utilise begin pour l'affichage
(define (compteur n)
  (if (= n 0)
      (begin (newline) (display 0))
      (begin (newline) (display n) (compteur (- n 1)))))
 (compteur 4)
;; on définit un compteur qui va de 0 a n et on utilise begin pour l'affichage
(define (compte n) (compte-aux 0 n))
(define (compte-aux i n)
  (if (= i n)
      (begin (newline) (display n))
      (begin (newline) (display i) (compte-aux (+ i 1) n)))
 )
(compte 4)
;; jeux de dés
(define (somme) (+ (+ 1 (random 6)) (+ 1 (random 6)) (+ 1 (random 6)))) ;; on fait le somme des trois des
(define (victoire? somme) (if (or (= somme 3) (= somme 5) (= somme 10) (= somme 15) (= somme 18) ) 1 0)) ;; on verife si on gagne
(define (play) (victoire? (somme)))

(define (nb-victoire-aux i m n)
  (if (= i n)
      (+ m (play))
     (nb-victoire-aux (+ i 1) (+ m (play)) n)))
(define (nb-victoire n) (begin  (newline) (display (nb-victoire-aux 1 0 n)) (display "/") (display n)))
(nb-victoire 100)