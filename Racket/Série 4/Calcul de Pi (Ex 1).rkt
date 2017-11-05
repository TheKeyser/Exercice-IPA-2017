;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Calcul de Pi (Ex 1)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; on définit une fonction nb_al qui donne un nombre aléatoire entre 0 et 1
;; pour ça on utilse la fonction random qui donne un nombre entre 0 et n-1 et
;;on divise 1 avec ce nombre
(define (nb_al)
  (let ((tmp (random 100)))
  (if (= tmp 0) 0 (/ 1 tmp))))
(nb_al)

;;on définit un fonction in_circle qui dis si oui ou nom un point apartient au cercle
;; on sait que si (x1, y1) appartient au cercle alors d((x1,y1), (xc, yc)) <= r

(define (in_circle Point_x Point_y Centre rayon)
  (let* ((x (- Point_x (car Centre)))
        (y (- Point_y (cadr Centre)))
        (distance (sqrt (+ (* x x) (* y y)))))
    (if (<= distance rayon) #t #f)))
;; on définit ensuite la fonction in_circleU? qui nous dis si le point est dans le cercle unité
(define (in_circleU? Point_x Point_y) (in_circle Point_x Point_y '(0 0) 1))

(define n_p 0)
(define (tirage)
  (if (in_circleU? (nb_al) (nb_al)) (set! n_p (+ 1 n_p)) (set! n_p n_p)))
(define (somme_n_p n)
  (if (= n 1)
      (tirage)
      (begin (tirage) (somme_n_p (- n 1)))))
;;on définit ensuite la fonction pi_al qui calcule pi en comptant le nombre de point dans le cercle
(define (pi_al n) (begin
                    (somme_n_p n)
                    (* 4  (/ n_p n))))
(pi_al 10000000)
                  
    
                                
           