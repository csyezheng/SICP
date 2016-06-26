#lang racket

;(define (square-list items)
;  (define (iter things answer)
;    (if (null? things)
;        answer
;        (iter (cdr things)
;              (cons answer
;                    (square (car things))))))     ; This code will generate a pair, not a list.
;  (iter items nill))

(define (square x) (* x x))

(define (reverse items)
  (define (iter seq ret)
    (if (null? seq)
        ret
        (iter (cdr seq) (cons (car seq) ret))))
  (iter items '()))

(define (square-iter items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (let ((squence (reverse items)))
    (iter squence '())))

(square-iter (list 1 2 3 4))