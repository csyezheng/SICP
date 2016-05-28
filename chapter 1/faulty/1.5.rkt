#lang racket

(define (p) (p))       ;; if (p) be called, it will go into infinite loop

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))      ;;在应用序中，所有被传入的实际参数都会立即被求值，进入无限循环
                  ;;在正则序中，传入的实际参数只有在有需要时才会被求值不进入无限循环