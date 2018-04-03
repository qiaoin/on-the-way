(define (f g)
  (newline)
  (display "+1")
  (g 2))

(define (square x) (* x x))

(f square)  ; 4

(f (lambda (z) (* z (+ z 1))))  ; 6

(f f)
