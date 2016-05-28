#lang racket

(define (make-interval a b)
  (if (< a b)
      (cons a b)
      (cons b a)))

(define (lower-bound z)
  (car z))

(define (upper-bound z)
  (cdr z))

(define (add-interval x y)
  (make-interval
   (+ (lower-bound x) (lower-bound y))
   (+ (upper-bound y) (upper-bound y))))

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))

(define (mul-interval a b)
  (let ((x-left (lower-bound a))(x-right (upper-bound a))(y-left (lower-bound b))(y-right (upper-bound b)))
    (cond ((< x-right 0)
       (cond ((< y-right 0)
              (make-interval (* x-right y-right)
                             (* x-left y-left)))
             ((> y-left 0)
              (make-interval (* x-left y-right)
                             (* x-right y-left)))
             (else
              (make-interval (* x-left y-right)
                                  (* x-left y-left)))))
      ((> x-left 0)
       (cond ((< y-right 0)
              (make-interval (* x-right y-left)
                             (* x-left y-right)))
             ((> y-left 0)
              (make-interval (* x-left y-left)
                             (* x-right y-right)))
             (else
              (make-interval (* x-right y-left)
                             (* x-right y-right)))))
      (else
        (cond ((< y-right 0)
               (make-interval (* x-right y-left)
                              (* x-left y-left)))
              ((> y-left 0)
               (make-interval (* x-left y-right)
                                            (* x-right y-right)))
              (else
               (make-interval (min (* x-right y-left) (* x-left y-right))
                              (max (* x-left y-left) (* x-right y-right)))))))))

(define (div-interval x y)
  (if ((not (and (< (lower-bound y))
                 (> (upper-bound y)))))
      (mul-interval x
                    (make-interval (/ 1.0
                                      (upper-bound y))
                                   (/ 1.0
                                      (lower-bound y))))
      (error " the interval across 0")))

    
   