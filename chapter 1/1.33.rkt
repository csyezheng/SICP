#lang racket

(define (square x) (* x x))

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                      (filtered-accumulate combiner null-value term (next a) next b filter))
          (filtered-accumulate combiner null-value term (next a) next b filter))))


(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n)
            n)
          ((divides? test-divisor n)
            test-divisor)
          (else
            (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (= (smallest-divisor n) n))

;===================== (a) ====================

(define (sum-prime a b)
  (filtered-accumulate +
                     0
                     (lambda (x) x)
                     a
                     (lambda (x) (+ x 1))
                     b
                     prime?))

(sum-prime 1 40)

;==================== (b) =====================

(define (product-prime n)
  (filtered-accumulate *
                       1
                       (lambda (x) x)
                       1
                       (lambda (x) (+ x 1))
                       n
                       prime?))

(product-prime 23)
          