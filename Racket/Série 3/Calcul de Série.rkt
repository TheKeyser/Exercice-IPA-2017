;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Calcul de Série|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (serie op fct a inc b) ;;on définit serie avec comme paramtrere op (+ ou *) fct (la fonction a aplliquer au pas
  ;; a la borne inf ,inc la fonction a appliquer pour passer au pas suivant, b la borne sup
  (if (> a b) ;;si on dépasse le borne sup
      (if (equal? op +) 0 1) ;; on verifie l'op et on renvoie 0 si c'est + et 1 sinon
      (op (fct a) (serie op fct (inc a) inc b)))) 

(define (carre x)(* x x))
(define (incr x)(+ x 1))
(define (identite x) x)
(define (racine x)(sqrt x))
(serie * carre 2 incr 5)
(serie + incr 2 carre 5)
(serie * identite 2 incr 5)

