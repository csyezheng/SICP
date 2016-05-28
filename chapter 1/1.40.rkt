#lang racket

(define (square x) (* x x))
(define (cub x) (* x x x))

;--- fixed-point ---

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  (let ((next (f first-guess)))
    (if (close-enough? next)
        next
        (fixed-point f next))))

;--- cublic ---
(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (cubic a b c)
  (lambda (x) (+ (cub x)
                 (* a (square x))
                 (* b x)
                 c)))

;---- newtons-method ----
(define (newtons-transform g)
  (lambda (x)
    (- x
       (/ (g x)
          ((deriv g) x)))))

(define (newtons-method f guess)
  (fixed-point (newtons-transform f) guess))



(newtons-method (cubic 2 4 5) 1)

                    
                   
                 