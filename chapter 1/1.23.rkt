#lang racket

(define (square num)
  (* num num))

(define (prime? num)
  
  (define (smallest-divisor)
    (find-divisor 2))

  (define (find-divisor test-divisor)
    (cond ((> (square test-divisor) num) num)
          ((divided? num test-divisor) test-divisor)
          (else (find-divisor (next test-divisor)))))

  (define (divided? a b)
    (= (remainder a b) 0))

  (define (next test-divisor)
    (if (= test-divisor 2)
        3
        (+ test-divisor 2)))

  (= (smallest-divisor) num))

(prime? 7)