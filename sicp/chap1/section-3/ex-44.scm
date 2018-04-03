(load "ex-43.scm")

(define (average x y z)
  (/ (+ x y z) 3))

(define dx 0.000001)

(define (smooth f)
  (lambda (x) (average (f (- x dx))
                       (f x)
                       (f (+ x dx)))))

(define (n-smooth f n)
  (let (n-smooth-repeated (repeated-iterator smooth n))
    (n-smooth-repeated f)))
