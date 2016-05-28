#lang racket

(define (cont-frac n d k)
  (define (do-cont-frac i)
    (if (= i k)
        (/ (n k)
           (d k))
        (/ (n i)
           (+ (d i)
              (do-cont-frac (+ i 1))))))
  (do-cont-frac 1))


(define (e-value k)
  (cont-frac (lambda (x) 1)
             (lambda (x) (if (= 0
                                (remainder (+ x 1) 3))
                             (* 2 (/ (+ x 1) 3))
                             1))
             k))

(+ 2 (e-value 40))