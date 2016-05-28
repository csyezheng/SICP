#lang racket

(define (exp base n)
  (if (= n 0)
      1
      (* base (exp base (- n 1)))))

(define (cons a b)
  (* (exp 2 a)
     (exp 3 b)))

(define (car z)
  (if (= 0
         (remainder z 2))
      (+ 1
         (/ z 2))
      0))

(define (car z)
  (if (= 0
         (remainder z 3))
      (+ 1
         (/ z 3))
      0))
