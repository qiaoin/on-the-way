(load "ex-37.scm")

(define (d i)
  (let ((m (quotient i 3))
        (n (remainder i 3)))
    (if (= n 2)
        (* (+ m 1.0) 2)
        1.0)))

(define (calculate-e k)
  (+ 2 (cont-frac (lambda (i) 1.0) d k)))

(calculate-e 1000)
