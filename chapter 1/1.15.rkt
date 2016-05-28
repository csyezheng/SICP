#lang racket

(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x)
     (* 4
        (cub x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3)))))

(sine 12.15)  ; p will be call 5 times, the last time will be ran to test conditions
; (sine a)      time complexity:theta(lga)        space complexity: theta(lga)