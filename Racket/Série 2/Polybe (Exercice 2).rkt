;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Polybe (Exercice 2)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; on définit la fonction getChiffre qui donne un chiffre entre 1 et 25 selon le caractère
(define (getChiffre char)
  ; si le char est en miniscule alors son code assic est supérieur ou égale 97, on enleve donc 96, sinon on enleve 64
  (if (>= (char->integer char) 97)   
     (if (>= (char->integer char) 119) (- (char->integer char) 97) (- (char->integer char) 96))
     (if (>= (char->integer char) 87) (- (char->integer char) 65) (- (char->integer char) 64))
  ))
(getChiffre #\Z)
(getChiffre #\F)
(getChiffre #\T)
;on définit getPolypeCode qui donne le code de Polybe d'un caractere donné
;on remarque que la colonne de polype d'un caractere corresponde au quotient entre ce chiffre et 5
; et que la ligne correspond au reste de la division entre le chiffre et 5 on a donc
(define (getPolypeCode char)
  (printf "~e~e" (+ (quotient (getChiffre char) 5) 1) (if (= (remainder (getChiffre char) 5) 0) 5 (remainder (getChiffre char) 5))))
(getPolypeCode #\Z)
(getPolypeCode #\F)
(getPolypeCode #\T)
(getPolypeCode #\L)
; on définit chiffre_msg
(define (lire_msg msg taille i)
     (cond
       ((< i taille) (begin (getPolypeCode (string-ref msg i)) (lire_msg msg taille (+ i 1))))
       (else (print "-fini"))))

(define (chiffrer msg)
  (begin (print "début:")
  (lire_msg msg (string-length msg) 0))
 )
(chiffrer "salut") 
  