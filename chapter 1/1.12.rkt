#lang racket

(define (Paska-sum n)
  (define (Paska n)
  (if (= n 1)
      1
      (* 2
         (Paska (- n 1)))))
  (if (= n 1)
      1
      (+ (Paska n)
         (Paska-sum (- n 1)))))

(Paska-sum 5)