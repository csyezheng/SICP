#lang racket

(define (last-pair sequence)
  (cond ((null? sequence)
         error "the list is empty")
        ((null? (cdr sequence))
         sequence)
        (else
         (last-pair (cdr sequence)))))

(last-pair (list 0 1 2 3 4 5 6))