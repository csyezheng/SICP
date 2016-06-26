#lang racket

(define (subsets s)
  (if (null? subsets)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x)           ; I don't know why the solution is it.
                            (cons (car s) x))
                          rest)))))