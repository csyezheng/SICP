#lang racket

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))    ;the row of code causes the 
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;it will lead to the expmod function be call twice of recursive