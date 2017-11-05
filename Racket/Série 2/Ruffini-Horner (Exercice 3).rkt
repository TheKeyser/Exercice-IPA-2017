;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Ruffini-Horner (Exercice 3)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (Ruffini x n i)
  (if (= i (- n 1))
      (+ i (* (+ i 1) x))
      (+ i (* x (Ruffini x n (+ i 1))))))
(define (Ruf-Hor x n)
  (* x (Ruffini x n 1)))
(Ruf-Hor 4 4)
(Ruf-Hor 2 3)

