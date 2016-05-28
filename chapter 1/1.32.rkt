#lang racket

;======================= recursive =============

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (define (add item1 item2)
    (+ item1 item2))
  (accumulate add 0 term a next b))

(define (product term a next b)
  (define (multi item1 item2)
    (* item1 item2))
  (accumulate multi 1 term a next b))

(sum (lambda (x) x) 1 (lambda (x) (+ 1 x)) 10)
(product (lambda (x) x) 1 (lambda (x) (+ 1 x)) 5) 

;======================= iterative ===============

(define (accumulate-iter combiner null-value term a next b)
  (define (accumulate-iter a null-value)
    (if (> a b)
        null-value
        (accumulate-iter (next a) (combiner null-value a))))
  (accumulate-iter a null-value))

(define (sum-iter term a next b)
  (accumulate-iter (lambda (item1 item2) (+ item1 item2)) 0 term a next b))

(define (product-iter term a next b)
  (accumulate-iter (lambda (item1 item2) (* item1 item2)) 1 term a next b))

(sum-iter (lambda (x) x) 1 (lambda (x) (+ 1 x)) 10)
(product-iter (lambda (x) x) 1 (lambda (x) (+ 1 x)) 5)