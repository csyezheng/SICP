#lang racket

; construct function

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; select function

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))                       ;there must use cadr because mobile construt by list not pair 

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))                        ; cadr

; total-weight

(define (total-weight mobile)
  (+ (branch-total-weight (left-branch mobile))
     (branch-total-weight (right-branch mobile))))

(define (branch-total-weight branch)         ; use different function to 
  (let ((struct (branch-structure branch)))  ; complete different part of program
    (if (is-mobile? struct)                  ; will reduce to complexity
        (total-weight struct)
        struct)))

(define (is-mobile? struct)
  (pair? struct))

; balance

(define (mobile-torque? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (torque-equal? left right)
         (branch-balance? left)
         (branch-balance? right))))

(define (torque-equal? left right)
  (= (* (branch-length left)
        (branch-total-weight left))
     (* (branch-length right)
        (branch-total-weight right))))

(define (branch-balance? branch)
  (let ((struct (branch-structure branch)))
    (if (is-mobile? struct)
        (mobile-torque? struct)
        #t)))

