;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Matrice (exo 1)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (produit-scalaire u v)
  (apply + (map * u v)))
(define vector1 '(1 2 3))
(define vector2 '(4 5 6))
(produit-scalaire vector1 vector2)
(define (mult matrice vecteur)
  (if (null? matrice)
      null
      (cons (produit-scalaire (car matrice) vecteur) (mult (cdr matrice) vecteur))))
(define M1 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(mult M1 vector1)