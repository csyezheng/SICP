#lang racket

; basic

(define (make-vect xcor ycor)
  (cons xcor ycor))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect vect1 vect2)
  (make-vect (+ (xcor-vect vect1)
                (xcor-vect vect2))
             (+ (ycor-vect vect1)
                (ycor-vect vect2))))

(define (sub-vect vect1 vect2)
  (make-vect (- (xcor-vect vect1)
                (xcor-vect vect2))
             (- (ycor-vect vect1)
                (ycor-vect vect2))))

(define (scale-vect s vect)
  (make-vect (* s
                (xcor-vect vect))
             (* s
                (ycor-vect vect))))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

; transform

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
         (make-frame new-origin
                     (sub-vect (m corner1) new-origin)
                     (sub-vect (m corner2) new-origin)))))))

; below

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((painter-top
           (transform-painter painter1
                              split-point
                              (make-vect 0.0 1.0)
                              (make-vect 1.0 0.5)))
          (painter-bottom
           (transform-painter painter2
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 1.0 0.0))))
      (lambda (frame)
        (painter-top frame)
        (painter-bottom frame)))))


; another implementation for below

(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((painter-left
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 0.5)))
          (painter-right
           (transform-painter painter2
                              split-point
                              (make-vect 0.5 1.0)
                              (make-vect 1.0 0.0))))
      (lambda (frame)
        (painter-left frame)
        (painter-right frame)))))

(define (another-below painter1 painter2)
  (rotate270 (beside (rotate270 painter1)
                     (rotate270 painter2))))