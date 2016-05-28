#lang racket

(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (try guess)
      (let ((next (improve guess)))
        (if (good-enough? guess next)
            next
            (try next))))
    (try first-guess)))

;--- sqrt ---

(define (average v1 v2)
  (/ (+ v1 v2)
     2))

(define (square x) (* x x))

(define (close-enough? guess x)
   (< (abs (- guess x)) 0.001))            ;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sqrt x)
  (define (improve guess)                ;can't be define outside, it requires x
    (average guess (/ x guess)))
  ((iterative-improve close-enough? improve) 1.0))

(sqrt 16)

;---- fixed-point ------

(define (fixed-point f first-guess)
  (define (improve guess)
    (f guess))
  ((iterative-improve close-enough? improve) first-guess))

(fixed-point square 2)                 ; out of memory........