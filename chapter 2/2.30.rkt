#lang racket

(define (square x) (* x x))

(define (square-tree1 sequence)
  (cond ((null? sequence)
         '())
        ((not (pair? sequence))
         (square sequence))
        (else
         (cons (square-tree1 (car sequence))
               (square-tree1 (cdr sequence))))))

(square-tree1 (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square-tree2 sequence)
  (map (lambda (subsequence)
         (if (not (pair? subsequence))
             (square subsequence)
             (square-tree2 subsequence)))
       sequence))

(square-tree2 (list 1 (list 2 (list 3 4) 5) (list 6 7)))