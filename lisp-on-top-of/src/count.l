(load "pair.l")
(load "list.l")
(load "map.l")
(load "iter.l")

;;; Count the number of occurrences of words in a file and print the top 10 words

(define text (file->string "bin/lisp"))
(define words-iter (re-find "\\w+" text))

;; count the words
(define words-count (make-map))
(define word (words-iter))
(while (not (empty? word))
  (set! words-count
        (map-put words-count word
                 (+ 1 (map-get-default words-count word 0))))
  (set! word (words-iter)))

(println "popular-words")
(define popular-words (sort (map-keys words-count) (lambda (key) (map-get words-count key))))
(print-list (take 10 (reverse popular-words)))

(define count (lambda (lst)
                (define count (make-map))
                (for-each (lambda (el)
                            (set! count
                                  (map-put count el
                                           (+ 1 (map-get-default count el 0)))))
                          lst)
                count))
                
