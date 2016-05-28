#lang racket

(define (abs x)
  (if (< x 0)                                             ;;if语句是个特殊形式，只会求解一个分支
      (- x)
      x))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))


(define (new-if predicate then-clause else-clause)         ;;new-if只是一个普通函数，它没有if所具有的特殊形式，根据解释器所使用的应用序求值规则
  (cond (predicate then-clause)                            ;;每个函数的实际参数在传入的时候都会被求值，因此，当使用new-if函数时，无论predicate是真还是假，
        (else else-clause)))                               ;; then-clause和 else-clause两个分支都会被求值。

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))                   ;; 无论测试结果是什么，都会无限递归下去

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average (/ x guess) guess))

(define (sqrt x)
  (sqrt-iter 1.0 x))


(sqrt 2)            ;; It will cause the program ran out of memory