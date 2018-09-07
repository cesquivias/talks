(define my-cons (lambda (a b)
                  (lambda (dir)
                    (if (eq? dir (quote car))
                        a
                      b))))

(define car (lambda (c)
              (c (quote car))))

(define cdr (lambda (c)
              (c (quote cdr))))

(define pair (my-cons 1 2))

(cdr pair)
