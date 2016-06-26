#lang racket

(define (fringe tree)
  (cond ((null? tree) '())
        ((not (pair? tree))
         (list tree))
        (else
         (append (fringe (car tree))              ; append is useful
                 (fringe (cadr tree))))))         ; nest list should use cadr to get a list

;test
(define x (list (list 1 2) (list 3 4)))
(fringe x)