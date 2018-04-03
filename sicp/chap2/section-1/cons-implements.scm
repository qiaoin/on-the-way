(define (cons-manual x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (display "Argument not 0 or 1 -- CONS error"))))
  dispatch)

(define (car-manual z) (z 0))

(define (cdr-manual z) (z 1))

(define z (cons-manual 2 3))

(car-manual z)

(cdr-manual z)
