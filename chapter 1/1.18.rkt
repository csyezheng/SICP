#lang racket

;================== double ===================
(define (double num)
  (+ num num))


;================= halve =====================
(define (halve num)
  (/ num 2))
      
;=================== multi =====================
(define (fast-multi a b)
  (cond ((= b 0) 0)
        ((even? b)
          (double (fast-multi a (halve b))))
        (else (+ a
                  (fast-multi a
                              (- b 1))))))

;================= multi-iter =====================
(define (fast-multi-iter a b product)
  (cond ((= b 0)
         product
        ((even? b) (fast-multi-iter (double a)
                                    (halve b)
                                    product))
        ((odd? b) (fast-multi-iter a
                               (- b 1)
                               (+ b product))))))
(define (multi a b)
  (fast-multi-iter a b 0))

(multi 3 5)


