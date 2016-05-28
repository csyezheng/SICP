#lang racket

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(gcd 206 40)
;normal-order evaluation
;(gcd 40 (remainder 206 40))
;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40))) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;fuck!!!!!!!!!!!!!!!!!!!

;applicative-order evaluation
;(gcd 40 (remainder 206 40))
;(gcd 6 (remainder 40 6))
;(gcd 4 (remainder 6 4))
;(gcd 2 (remainder 4 2))
; 4 times