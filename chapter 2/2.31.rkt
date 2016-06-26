#lang racket


(define (tree-map func sequence)
  (cond ((null? sequence)
         '())
        ((not (pair? sequence))
         (func sequence))
        (else
         (cons (tree-map func (car sequence))
               (tree-map func (cdr sequence))))))

(define (square x) (* x x))

(define (square-tree tree)
  (tree-map square tree))

(square-tree (list 1 (list 2 (list 3 4) 5 (list 6 7))))
              