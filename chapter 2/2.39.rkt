#lang racket

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (reverse-one sequence)
  (fold-right (lambda (x y)
                (append y (list x)))       ; if use cons y x, the result will be '((((() 4) 3) 2) 1)....
              '()
              sequence))

(define (reverse-two sequence)
  (fold-left (lambda (x y)
               (cons y x))
             '()
             sequence))

(reverse-one (list 1 2 3 4))
(reverse-two (list 5 6 7 8))