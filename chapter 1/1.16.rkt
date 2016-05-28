#lang racket

(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (fast-expt b n)
  (define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (square b)
                                     (/ n 2)
                                     a))
          (else (* b (fast-expt-iter b
                                     (- n 1)
                                     a)))))
  (fast-expt-iter b n 1))

(fast-expt 2 3)