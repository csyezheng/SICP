#lang racket

(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1))
         (* 2 (f1 (- n 2)))
         (* 3 (f1 (- n 3))))))


(define (f2 n)
  (define (f2-iter before prev curr n)
    (if (= n 0)
        curr
        (f2-iter prev curr
                 (+ curr
                    (* 2 prev)
                    (* 3 before))
                 (- n 1))))
  (if (< n 3)
      n
      (f2-iter 0 1 2 (- n 2))))


(f2 5)