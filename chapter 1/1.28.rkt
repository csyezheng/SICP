#lang racket

(define (square x)
  (* x x))

(define (fast-prime? num times)
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((nontrivial-square-root? base m) 0)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else
           (remainder (* base
                         (expmod base (- exp 1) m))
                         m))))
  
  (define (nontrivial-square-root? a n)                 ;;;;;;;;;;;;;;;;
    (and (not (= a 1))
         (not (= a (- n 1)))
         (= 1 (remainder (square a) n))))
  
  (define (Miller-Rabin-test)
    (define (try-it a)
      (= (expmod a (- num 1) num) 1))
    (let ((times (ceiling (/ num 2))))
      (try-it (+ 1 (random (- num 1))))))

  (cond ((= times 0) #t)
        ((Miller-Rabin-test) (fast-prime? num (- times 1)))
        (else #f)))

(fast-prime? 561 20)
(fast-prime? 1105 20)
(fast-prime? 199 20)

        
          
                       
                                 