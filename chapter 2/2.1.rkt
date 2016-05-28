#lang racket

(define (square x) (* x x))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((and (positive? g)(negative? n) (positive? d))
           (cons (/ n g) (/ d g)))
          ((or (and (positive? g) (positive? n) (positive? d))
               (and (negative? g) (positive? n) (negative? d)))
               (cons (- (/ n g)) (/ d g)))
          ((or (and (positive? g) (positive? n) (negative? d))
               (and (negative? g)(negative? n) (positive? d)))
           (cons (- (/ n g)) (- (/ d g)))))))
          
(define (numer x)
  (car x))

(define (demon x)
  (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (cdr x)))


(print-rat (make-rat -18 12))         