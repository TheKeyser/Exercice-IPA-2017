;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Serie 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
    ;; exercice 1
;on définit les valeurs cinq, moins, neuf, six, vrai
(define cinq 7)
(define moins 9)
(define neuf -)
(define six 4)
(define vrai #t)
;on utilise ensuite ces définitions
cinq
(= (+ cinq six) 11)
(neuf moins cinq)
(and (> six cinq) vrai)
   ;;exercice 2
; on teste le mode Debug de DrRacket avec une exemple tiré du cours
(define (cube x) (* x x x))
(define (carre x) (* x x))
(+ (* 3 (cube 2)) (* (carre 4)(carre 4)))
   ;; Exercice 3
; on teste les differences de langage entre R5RS et Advanced Student
(define x 4)
;(define x 3)
;on constate qu'en R5RS on peut redefinir des variables
  ;; Exercice 3.5
; on teste le mode pas à pas avec le langage "Intermediate Student with Lambda"
(+ (* 3 (cube 2)) (* (carre 4)(carre 4)))
  ;;exercice 4
;on définit la fonction x --> x+5
(define (f x) (+ x 5))
;; on applique la fonction à différentes valeurs
;; x = 3
(f 3)
;; x = 3
(f 3)
;; x = 10, y = 3
(f 10)
(f 3)
;; x = 4, y = 2, z = 6
(f 4)
(f 2)
(f 6)
;; on lance en mode pas à pas
  ;; Exerecice 5
(define (g x) (+ x (g(- x 1))))
;(g 4)
;; on constate que le programme boucle indéfiniment 