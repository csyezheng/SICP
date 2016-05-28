#lang racket

(define (square x) (* x x))

;============================= recursive =======================

(define (product term low next high)
  (if (> low high)
      1
      (* (term low)
         (product term
                  (next low)
                  next
                  high))))

(define (identity x) x)
(define (inc x) (+ 1 x))

;---- factorial -----
(define (factorial num)
  (product identity 1 inc num))

(factorial 5)

;---- pi-value -----

(define (numer-term i)                       
    (cond ((= i 1) 2)                                     
          ((even? i)
           (+ i 2))
          (else 
           (+ i 1))))

  (define (denom-term i)
    (if (even? i)
        (+ i 1)
        (+ i 2)))

(define (pi-value limit)
  (* 4
     (exact->inexact
      (/ (product numer-term 1 inc limit)        ;exact->inexact
         (product denom-term 1 inc limit)))))

(pi-value 10000)


;===========================  iteratative  ======================

(define (product-iter term low next high)
  (define (do-product-iter low result)
    (if (> low high)
        result
        (do-product-iter (next low)
                      (* result
                         (term low)))))
  (do-product-iter low 1))

;---- factorial-iter ---
(define (factorial-iter num)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (product-iter identity 1 inc num))

(factorial-iter 5)

;--- pi-val-iter ---
(define (pi-val-iter limit)
  (define (numer i)
    (cond ((= i 1) 2)
          ((even? i) (+ i 2))
          (else (+ i 1))))
  (define (denom i)
    (if (even? i)
        (+ i 1)
        (+ i 2)))
  (* 4
     (exact->inexact
      (/ (product-iter numer 1 (lambda (x) (+ x 1)) limit)
         (product-iter denom 1 (lambda (x) (+ x 1)) limit)))))

(pi-val-iter 10000)
