#lang racket

; vect
(define (make-vect xcor ycor)
  (cons xcor ycor))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cadr vect))

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

; frame
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

; frame-coord-map
(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

; segments
(define (make-segment start end)
  (list start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cadr segment))

; draw painter and give a frame
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define tl (make-vect 0 6))
(define tr (make-vect 6 6))
(define bl (make-vect 0 0))
(define br (make-vect 6 0))

; (a)
(define top (make-segment tl tr))
(define left (make-segment t1 bl))
(define right (make-segment tr br))
(define bottom (make-segment bl br))

(segment->painter (list top bottom left right))


; (b)

(define bl-tr (make-segment bl tr))
(define tl-br (make-segment tl br))

(segment->painter (list bl-tr tl-br))

; (c)

(define top-mid (make-vect 3 6))
(define left-mid (make-vect 0 3))
(define right-mid (make-vect 6 3))
(define bottom-mid (make-vect 3 0))

(define left-top-mid (make-segment left-mid top-mid))
(define top-right-mid (make-segment top-mid right-mid))
(define right-bottom-mid (make-segment right-mid bottom-mid))
(define bottom-left-mid (make-segment bottom-mid left-mid))

(segment->painter (list left-top-mid top-right-mid right-bottom-mid bottom-left-mid))
