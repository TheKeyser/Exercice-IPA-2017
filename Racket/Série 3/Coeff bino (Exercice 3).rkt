;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Coeff bino (Exercice 3)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (fact n) (fact-aux 1 1 n))
(define (fact-aux produit numerateur n)
  (if (> numerateur n)
      produit
      (fact-aux (* produit numerateur) (+ numerateur 1) n))) ;;on définit factorielle en récurssion terminal comme dans le cour
(define (coeff-bi n k)
  (if (or (= k 0) (= k n))
      1
      (/ (fact n) (*  (fact k) (fact (- n k))))))

(define (pascal n fin) (pascal-aux 0 n fin))
(define (pascal-aux i n fin)
  (if (= i fin)
      (\begin (newline) (display (coeff-bi n i)))
      (begin (newline)(display (coeff-bi n i)) (pascal-aux (+ i 1) n fin))))
(pascal 6 6)