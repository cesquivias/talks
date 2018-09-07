;;; A pair data structure made of functions with message passing used to return
;;; different values

(define cons (lambda (a b)
               (lambda (msg)
                 (if (eq? msg (quote car))
                     a
                   (if (eq? msg (quote cdr))
                       b
                     (if (eq? msg (quote set-car!))
                         (lambda (new-val)
                           (set! a new-val))
                       (if (eq? msg (quote set-cdr!))
                           (lambda (new-val)
                             (set! b new-val))
                         ())))))))

(define car (lambda (c) 
              (c (quote car))))
(define cdr (lambda (c)
              (c (quote cdr))))

(define set-car! (lambda (pair new-val)
                   ((pair (quote set-car!)) new-val)))
(define set-cdr! (lambda (pair new-val)
                   ((pair (quote set-cdr!)) new-val)))
