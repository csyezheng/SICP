#lang racket

(define (abs x)                       ;;It have defined inside Scheme
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
                      x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess)               ;;should use cube function
             x))
     0.0001))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))

(cube-root 28)