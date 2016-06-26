#lang racket

(define (reverse sequence)
  (define (iter seq result)
    (if (null? seq)
        result
        (iter (cdr seq)
              (cons (car seq) result))))
  (iter sequence '()))


;(define (reverse sequence)
;  (if (null? sequence)
;      '()
;      (cons (reverse (cdr sequence))
;            (car sequence))))     ;this code will generate a pair, not a list.

(reverse (list 0 1 2 3 4))