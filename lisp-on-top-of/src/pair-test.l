(load "pair.l")

(define a-pair (cons 1 2))

(if (eq? (car a-pair) 1)
    (print ".")
  (println "E\ncar doesn't return the first element in a pair"))

(if (eq? (cdr a-pair) 2)
    (print ".")
  (println "E\ncdr doesn't return the second element in a pair"))

(set-car! a-pair 3)
(if (eq? (car a-pair) 3)
    (print ".")
  (println "E\nset-car! doesn't change the value of car"))
(set-cdr! a-pair 4)
(if (eq? (cdr a-pair) 4)
    (print ".")
  (println "E\nset-cdr! doesn't change the value of cdr"))
  
