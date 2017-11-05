;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Time (Ex 2)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (seconde L) (+ (* 60 60 (car L)) (* 60 (cadr L)) (caddr L)))

(define (somme-seconde L res)
  (if (null? L)
      res
      (somme-seconde (cdr L) (+ res (seconde (car L))))))
(apply + (map seconde (list (list 1 19 30) (list 0 20 0) (list 0 49 50))))

(define (maxTime L L-s res)
  (if (null? L)
      res
      (if (< res (car L)) (maxTime (cdr L) (cdr L-s) (car L)) (maxTime (cdr L) (cdr L-s) res) 
  