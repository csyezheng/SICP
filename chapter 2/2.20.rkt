#lang racket

(define (same-parity value . sequence)        
  (filter (if (even? value)         ; filter is build in the Scheme
              even?
              odd?)
          (cons value sequence)))   

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)