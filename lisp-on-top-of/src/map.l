(load "base.l")
(load "list.l")

;;; A map data structure built off of a list of pairs
;;; The key is the first element in the pair and the value is the second

(define get-key car)
(define get-val cdr)
(define make-map (lambda () ()))
(define map-get (lambda (map key)
                  (while (and (not (empty? map))
                              (not (eq? (get-key (first map)) key)))
                    (set! map (rest map)))
                  (if (eq? map ())
                      ()
                    (get-val (first map)))))

(define map-get-default (lambda (map key default)
                          (define val (map-get map key))
                          (if (eq? val ())
                              default
                            val)))

(define map-put (lambda (map key val)
                  (define the-map map)
                  (while (and (not (empty? the-map))
                              (not (eq? (get-key (first the-map)) key)))
                    (set! the-map (rest the-map)))
                  (if (empty? the-map)
                      (set! map (cons (cons key val) map))
                    (set-cdr! (first the-map) val))
                  map))

(define map-keys (lambda (map)
                   (define output ())
                   (while (not (empty? map))
                     (set! output (cons (get-key (first map)) output))
                     (set! map (rest map)))
                   output))

