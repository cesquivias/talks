(load "map.l")

(define my-map (make-map))
(if (empty? (map-get my-map "foo"))
    (print ".")
  (println "E\n map-get with missing key should return empty list"))

(set! my-map (map-put my-map "foo" 1))
(if (eq? (map-get my-map "foo") 1)
    (print ".")
  (println "E\nmap-put didn't set map value"))

(set! my-map (map-put my-map "foo" 2))
(if (eq? (map-get my-map "foo") 2)
    (print ".")
  (println "E\nCannot rewrite key's value"))

(set! my-map (map-put my-map "bar" 3))
(if (and (eq? (map-get my-map "bar") 3)
         (eq? (map-get my-map "foo") 2))
    (print ".")
  (println "E\nCannot add new key/val pair"))

(if (eq? (map-get-default my-map "baz" 0) 0)
    (print ".")
  (println "E\nMissing key doesn't return default"))
