#lang racket

(define (make-interval a b)
  (if (< a b)
      (cons a b)
      (cons b a)))

(define (upper-bound z) (cdr z))

(define (lowe-bound z) (car z))