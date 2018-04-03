(define (cons-manual x y)
  (lambda (m) (m x y)))

(define (car-manual z)
  (z (lambda (p q) p)))

(define (cdr-manual z)
  (z (lambda (p q) q)))

(define z (cons-manual 3 4))

(car-manual z)

(cdr-manual z)
