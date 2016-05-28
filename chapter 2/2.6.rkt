#lang racket

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; (add-1 zero)
; (lambda (f) (lambda (x) (f
;                            (((lambda (x) x) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f x))))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

; (add-1 zero)
;(lambda (f)
;  (lambda (x) (f ((
;                   (lamdba (f)
;                           (lambda (x) (f x)))
;                   f) x))))

; (lambda (f)
;   (lambda (x) (f ((
;                    lambda (x) (f x)) x))))

;(lambda (f)
;  (lambda (x) (f ((f x)))))

(define two
  (lambda (f)
    (lambda (x)
      (f ((f x))))))


;-------------------------------------------------------I don't know
(define +
  (lamnda (m)
          (lambda (n)
            (lambda (f)
              (lambda (x)
                (m f (n f x)))))))   ; god
                              