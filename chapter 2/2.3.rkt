#lang racket

; construct point and select x y coodinates axis
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

; use the left-above corner and the right-bottom corner to represent rectangle
(define (make-rectangle left-bottom-corner right-top-corner)
  (cons left-bottom-corner right-top-corner))

(define (select-left-corner rectangle)
  (car rectangle))

(define (select-right-corner rectangle)
  (cdr rectangle))

(define (length-of-rectangle rec)
  (- (x-point (select-right-corner rec))
           (x-point (select-left-corner rec))))

(define (width-of-rectangle rec)
  (- (y-point (select-right-corner rec))
           (y-point (select-left-corner rec))))

; use the two segments of rectangle to represent rectangle
(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-ractangle-segments  len wth)
  (cons len wth))

(define (len-seg rec)
  (car rec))

(define (wth-seg rec)
  (cdr rec))

(define (length-of-rectangle2 rec)
  (let ((length (len-seg rec)))
    (let ((start (start-segment length))
          (end (end-segment length)))
          (- (x-point end)
             (x-point start)))))

(define (width-of-rectangle2 rec)
  (let ((width (wth-seg rec)))
    (let ((start (start-segment width))
          (end (end-segment width)))
      (- (y-point end)
         (y-point start)))))        ;!!!!!!!!!!!!!!!!!how to let perimeter and areas fuction work well for different expression
        
; calculate perimeter and areas of retangle  
(define (perimeter-rectangle rec)
  (* 2
     (+ (length-of-rectangle rec) (width-of-rectangle rec))))

(define (areas-rectangle rec)
  (* (length-of-rectangle rec)
     (width-of-rectangle rec)))

; test
(perimeter-rectangle (make-rectangle (make-point 2 1) (make-point 8 6)))
(areas-rectangle (make-rectangle (make-point 2 1) (make-point 8 6)))