;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Triange (Exo 2)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require graphics/turtles)
(turtles)
(define (dessiner-triangle n)
  (begin (draw n)
  (turn 120)
  (draw n)
  (turn 120)
  (draw n)
  (turn -240)))


(define (triangle-sierpinski dimension level)
  (if (= level 0)
      (begin (move (/ dimension 2))
             (turn 60)
             (dessiner-triangle (/ dimension 2))
             (turn -60)
             (move (- (/ dimension 2)))
             )
      
      (begin (dessiner-triangle (/ dimension 2))
             (triangle-sierpinski (/ dimension 2) (- level 1))
             (move (/ dimension 2))
             (dessiner-triangle (/ dimension 2))
             (triangle-sierpinski (/ dimension 2) (- level 1))
             (turn 120)
             (move (/ dimension 2))
             (turn -120)
             (dessiner-triangle (/ dimension 2))
             (triangle-sierpinski (/ dimension 2) (- level 1))
             (turn -120)
             (move (/ dimension 2))
             (turn 120)
             
             )))

(triangle-sierpinski 400 3)
             