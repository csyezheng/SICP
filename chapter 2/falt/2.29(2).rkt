#lang racket

; use new construct function to express should change the following functions

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))


;============the following function don't be changed =========

; total-weight

(define (total-weight mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (+ (branch-total-weight left)
       (branch-total-weight right))))

(define (branch-total-weight branch)
  (let ((struct (branch-structure branch)))
    (if (is-mobile? struct)
        (total-weight struct)
        struct)))

(define (is-mobile? struct)
  (pair? struct))

; balance

(define (mobile-balance? mobile)
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
  (if (is-mobile? (branch-structure branch))
      (mobile-balance? branch)
      #t))
        
            