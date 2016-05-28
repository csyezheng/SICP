#lang racket

(define (average v1 v2)
  (/ (+ v1 v2)
     2))

; use repeated to calculate n times exponent
(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x)
        (f ((repeated f (- n 1)) x)))))

(define (exp base n)
  (if (= n 0)
      1
      ((repeated (lambda (x) (* base x)) n) 1)))


; fiexed-point
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  (let ((next (f first-guess)))
    (if (close-enough? next)
        next
        (fixed-point f next))))

; average-damp
(define (average-damp f)
  (lambda (x)
    (/ (average x
                (f x)))))

(define (average-damp-n-times f damp-times)
  ((repeated average-damp damp-times) f))


; calculate n times root
(define (n-times-root n damp-times)
  (lambda (x)
    (fixed-point
     (average-damp-n-times
      (lambda (y)
        (/ x
           (exp y (- n 1))))
      damp-times)
     1.0)))

(n-times-root 5 20)