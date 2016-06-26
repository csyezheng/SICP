#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x rest)
                (if (not (pair? x))
                    (+ 1 rest)
                    (+ (count-leaves x)
                       rest)))
              0
              t))

(count-leaves (list 1 (list 2 (list 3 4) 5 (list 6 7))))
              