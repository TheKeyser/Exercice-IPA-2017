;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Série de Taylor (Exercice 1)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; on définit de façon recursive la fonction factorielle
; comme n! = (n-1)!n et 1! = 1 on a
(define (facto nombre)
  (if (= nombre 1)
      1
      (* nombre (facto (- nombre 1)))))
; essai avec plusieur chiffre
(facto 1)
(facto 10)
; on définit ensuite l'operation ^ qui augment n'importe quel nombre a une puissance donné
(define (^ nombre puissance )
  (if (= puissance 1)
      nombre
      (* nombre (^ nombre (- puissance 1)))))
;essai avec plusieur chiffre
(^ 2 6)
;on définit la fonction de taylor pour e^x
(define (taylor_expo x n)
  (if (= n 0)
      0
      (+ (/ (^ x n) (facto n)) (taylor_expo x (- n 1)))))
(taylor_expo 4 100)
;;on définit la fonction de taylor pour cos
(define (taylor_cos x n)
  (if (= n 0)
      1
      (+ (/ (* (^ (- 1) n) (^ x (* 2 n))) (facto (* 2 n))) (taylor_cos x (- n 1)))))
(taylor_cos 4 1000)
