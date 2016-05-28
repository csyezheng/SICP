#lang racket

(define (cont-frac n d k)
  (define (do-cont-frac i)
    (if (= k i)
        (/ (n k) (d k))
        (/ (n i)
           (+ (d i) (do-cont-frac (+ i 1))))))
  (do-cont-frac 1))


(+ 1 (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10000))


(define (cont-frac-iter n d k)           ; this program doesn't work well
  (define (do-cont-frac i result)        ; I don't know how to fix it now.
    (if (= i 0)
        result
        (do-cont-frac (- i 1)
                      (/ (n i)
                         (+ (d i) result)))))
  (do-cont-frac (- k)
                (/ (n k) (d k))))


(+ 1 (cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           100))