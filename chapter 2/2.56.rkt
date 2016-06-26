#lang racket

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) exp)
                   (deriv (augend exp) exp)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (multiplicand exp)
                        (deriv (multiplier exp) var))))
        ((exponentiation? exp)
         (make-product (exponent exp)
                       (make-exponentiation (base exp)
                                            (- (exponent exp) 1))
                       (deriv (base exp) var)))
        (else
         (error "unknow expression type -- DERIV" exp))))


; --------- 

(define (variable? exp) (symbol? exp))

(define (same-variable? exp var)
  (and (variable? exp) (variable? var) (eq? exp var)))

(define (sum? exp)
  (and (pair? exp)
       (eq? (car exp) '+)))

(define (make-sum exp1 exp2)
  (cond ((=number? exp1 0) exp2)
        ((=number? exp2 0) exp1)
        ((and (number? exp1) (number? exp2))
         (+ exp1 exp2))
        (else
         (list '+ exp1 exp2))))

(define (addend exp)
  (cadr exp))

(define (augend exp)
  (caddr exp))

(define (product? exp)
  (and (pair? exp)
       (eq? (car exp) '*)))

(define (make-product exp1 exp2)
  (cond ((or (=number? exp1 0)
             (=number? exp2 0))
         0)
        ((=number? exp1 1) exp2)
        ((=number? exp2 1) exp1)
        ((and (number? exp1)
              (number? exp2))
         (* exp1 exp2))
        (else
         (list '* exp1 exp2))))

(define (multiplier exp)
  (cadr exp))

(define (multiplicand exp)
  (caddr exp))

(define (=number? exp num)
  (and (number? exp)
       (= exp num)))

; 2.56

(define (exponentiation? exp)
  (and (pair? exp)
       (eq? (car exp) '**)))

(define (base exp)
  (cadr exp))

(define (exponent exp)
  (caddr exp))

(define (make-exponentiation u n)                         
    (cond ((=number? u 0) 0)                                                      
          ((=number? n 0) 1)
          ((and (number? u)
                (number? n))
           (calculate-exponentiation u n))
          (else                                                     
            (list '** u n))))  

(define (calculate-exponentiation base exponent)
  (if (= exponent 1)
      base
      (* base (calculate-exponentiation base (- exponent 1)))))