(load "list.l")

(define iter->list (lambda (iter)
                     (define ->list (lambda (output)
                                      (define item (iter))
                                      (if (eq? item ())
                                          output
                                        (->list (cons item output)))))
                     (reverse (->list ()))))

(define print-re-words (lambda (words-iter)
                         (define word (words-iter))
                         (while (not (empty? word))
                           (println word)
                           (set! word (words-iter)))))
