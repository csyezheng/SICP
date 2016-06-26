#lang racket

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (map (lambda (k)
                           (list i j k))
                         (enumerate-interval 1 (- j 1))))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
            (enumerate-interval (+ low 1) high))))

(define (equal-s? seq)
  (define (do-equal-s s)
    (= (+ (car seq)
          (cadr seq)
          (caddr seq))
       s))
  (do-equal-s 3))       ; here can use a number

(define (pair-sum-s n s)
  (filter equal-s?
          (unique-pairs n)))
