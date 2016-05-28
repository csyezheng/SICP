#lang racket

(define (square x) (* x x))

(define (cont-frac n d k)
  (define (do-cont-frac i)
    (if (= i k)
        (/ (n k)
           (d k))
        (/ (n i)
           (+ (d i)
              (do-cont-frac (+ i 1))))))
  (do-cont-frac 1))

(define (tan-cf x k)
  (exact->inexact
   (cont-frac (lambda (i) (if (= i 1)
                             x
                             (- (square x))))
             (lambda (i) (- (* 2 i) 1))
             k)))

(tan-cf 20 18)