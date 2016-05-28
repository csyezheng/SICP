#lang racket

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (mid-point segment)
  (make-point (/ (+ (car (car segment))
                    (car (cdr segment)))
                 2)
              (/ (+ (cdr (car segment))
                    (cdr (cdr segment)))
                 2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; test
(define seg
  (make-segment (make-point 2 3)
                (make-point 6 7)))
(print-point (mid-point seg))