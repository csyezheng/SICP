#lang racket

; my first solution is faulty

;(cdaddr (list 1 3 (list 5 7) 9))                       ; the result is '()

;(caar (list (list 7)))

;(cdadar (cdadr (cadadr (list 1                         ; the result is '(7)
;                             (list 2
;                                   (list 3
;                                         (list 4
;                                               (list 5
;                                                     (list 6 7)))))))))




(car (cdaddr (list 1 3 (list 5 7) 9)))

(caar (list (list 7)))

(cadadr (cadadr (cadadr (list 1
                             (list 2
                                   (list 3
                                         (list 4
                                               (list 5
                                                     (list 6 7)))))))))

; (cdr (list a (list b c)))
; the result is '((b c))