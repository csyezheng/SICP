#lang racket

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- guess
             (improve guess x)))
     0.001))

(define (improve guess x)
  (average (/ x guess) guess))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)
