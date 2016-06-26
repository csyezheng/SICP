#lang racket

; reverse is a built-in fucntion

(define (deep-reverse items)
  (cond ((null? items)
         '())
        ((not (pair? items))
         items)
        (else
         (reverse (list (deep-reverse (car items))
                        (deep-reverse (cadr items)))))))


;test
(define x (list (list 1 2) (list 3 4)))

(deep-reverse x)