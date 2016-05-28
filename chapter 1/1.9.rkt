#lang racket

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

;;(inc (+ (dec 4) 5))))
;;(inc (inc (+ (dec 3) 5)))
;;(inc (inc (inc (+ (dec 2) 5))))
;;(inc (inc (inc (inc (+ 0 5))))
;;(inc (inc (inc (inc 5))))
;;(inc (inc (inc 6)))
;;(inc (inc 7))
;;(inc 8);
;;9

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

;;(+ (dec 4) (inc 5))
;;(+ (dec 3) (inc 6))
;;(+ (dec 2) (inc 7))
;;(+ (dec 1) (inc 8))
;;(+ 0 9)
;;9