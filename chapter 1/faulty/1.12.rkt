#lang racket

(define (Paska n)
  (if (= n 1)
      1
      (* 2
         (Paska (- n 1)))))

(define (Paska-sum n)
  (if (= n 1)
      1
      (+ (Paska n)
         (Paska-sum (- n 1)))))

(Paska-sum 4)