#lang racket


(define (even? x)
  (= (remainder x 2) 0))

;================== double ===================
(define (double num)
  (+ num num))


;================= halve =====================
(define (halve num)
  (/ num 2))
      
;=================== multi =======================
(define (fast-multi a b)
  (cond ((= b 0) 0)
        ((even? b)
          (double (fast-multi a (halve b))))
        (else (+ a
                  (fast-multi a
                              (- b 1))))))

(fast-multi 2 5)

