#lang racket

(define (double func)
  (lambda (x)
    (func (func x))))

(define (inc val)
  (+ val 1))

(((double (double double)) inc) 5)

; (double double) will grenerate a function to increase 4 times
; the function double outside has the arguments .........16.............