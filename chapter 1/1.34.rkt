#lang racket

(define (f g)
  (g 2))

(f f)  ;application: 2 is not a procedure
       ; can't be applied to arguments
      