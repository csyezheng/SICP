#lang racket

(define (for-each process sequence)
  (if (null? sequence)
      #t
      (begin (process (car sequence))              ; begin can let the following process run in order 
             (for-each process (cdr sequence)))))


(for-each (lambda (x) (newline) (display x)) (list 0 1 2 3))