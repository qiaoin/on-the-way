(define (compose g f)
  (lambda (x) (g (f x))))

(define (square x) (* x x))

(define (inc x) (+ x 1))

((compose square inc) 6)
