#lang racket

(define (square x)
  (* x x))

(define (fast-prime? num times)
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))
  (define (fermat-test)
    (define (try-it a)
      (= (expmod a num num) a))
    (try-it (+ 1 (random (- num 1)))))

  (cond ((= times 0) #t)
        ((fermat-test) (fast-prime? num
                                    (- times 1)))
        (else #f)))

(fast-prime? 561 20)
(fast-prime? 1105 20)
(fast-prime? 1729 20)
(fast-prime? 2465 20)
(fast-prime? 2821 20)
(fast-prime? 6601 20)

