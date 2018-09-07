(load "iter.l")

(define my-text "foo bar baz")
(define foos-iter (re-find "\\w+" my-text))
(define foos (iter->list foos-iter))
(if (list-eq? foos (cons "foo" (cons "bar" (cons "baz" ()))))
    (print ".")
  (println "E\nCannot convert iterator to list"))
