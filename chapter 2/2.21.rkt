#lang racket

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-the-list items)
  (map square items))              ; map has defined in the Scheme



(square-list (list 1 2 3 4))
(square-the-list (list 1 2 3 4))