#lang racket

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base
                       (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (search-for-primes n times)
  
  (define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (current-inexact-milliseconds)))

  (define (start-prime-test n start-time)
    (if (fast-prime? n times)
        (report-prime (- (current-inexact-milliseconds) start-time))
          (search-for-primes (+ n 1) times)))

  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

  (timed-prime-test n))

  

(search-for-primes 190 20)  

          