#lang racket

;(define (expmod base exp m)
;  (cond ((= exp 0) 1)
;        ((even? exp)
;         (remainder (square (expmod base (/ exp 2) m))
;                    m))
;        (else
;         (remainder (* base
;                       (expmod base (- exp 1) m))
;                    m))))

; this program will call remainder to limit value each time, which can prevent from out of memory




;(define (expmod base exp m)
;  (remainder (fast-expt base exp) m))

;this program will not call remainder each time, maybe it will cause out of range.