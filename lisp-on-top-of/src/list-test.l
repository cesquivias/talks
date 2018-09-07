(load "list.l")

(define my-list (cons 9 (cons 2 (cons 3 (cons 4 ())))))

(if (eq? (first my-list) 9)
    (print ".")
  (println "E\nfirst doesn't return the first element in the list"))

(if (eq? (list-ref my-list 2) 3)
    (print ".")
  (println "E\nlist-ref doesn't get the correct element in the list"))

(if (empty? ())
    (print ".")
  (println "E\empty? broken"))

(if (list-eq? my-list (cons 9 (cons 2 (cons 3 (cons 4 ())))))
    (print ".")
  (println "E\nlist-eq? doesn't work for equal lists"))

(if (list-eq? my-list ())
    (println "E\nlist-eq? broken for uneven lists")
  (print "."))

(if (list-eq? (reverse my-list) (cons 4 (cons 3 (cons 2 (cons 9 ())))))
    (print ".")
  (println "E\nreverse broken"))

(if (list-eq? (filter my-list (lambda (el) (eq? el 2))) (cons 2 ()))
    (print ".")
  (println "E\nfilter doesn't work"))

(define another-list (cons 0 (cons 0 ())))
(if (list-eq? (concat! another-list my-list)
              (cons 0 (cons 0 (cons 9 (cons 2 (cons 3 (cons 4 ())))))))
    (print ".")
  (println "E\nCannot concat 2 lists"))

(if (list-eq? (concat! () my-list)
              (cons 9 (cons 2 (cons 3 (cons 4 ())))))
    (print ".")
  (println "E\nCannot concat an empty list in the front"))

(if (list-eq? (sort my-list (lambda (x) x))
              (cons 2 (cons 3 (cons 4 (cons 9 ())))))
    (print ".")
  (println "E\nCannot sort"))

(if (list-eq? (take 10 my-list) (cons 9 (cons 2 (cons 3 (cons 4 ())))))
    (print ".")
  (println "E\nCannot take more items than in list"))
