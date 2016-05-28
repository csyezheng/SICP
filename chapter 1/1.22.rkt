#lang racket

(define (square x)
  (* x x))

(define (prime? n)
  (define (smallest-divisor)
    (find-divisor 2))
  (define (find-divisor test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (= (smallest-divisor) n))


(define (search-for-primes start)
  
  (define (time-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (current-inexact-milliseconds)))
  
  (define (start-prime-test n start-time) 
    (if (prime? n)
       (report-time n (- (current-inexact-milliseconds) start-time))
       (search-for-primes (+ start 1))))
  
  (define (report-time n elapse-time)
    (display " *** ")
    (display elapse-time))
  
  (time-prime-test start))

(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)