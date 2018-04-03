(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-manual x)
  (define (good-enough? old-guess new-guess)
    (< (/ (abs (- new-guess old-guess)) old-guess) 0.00000001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter old-guess new-guess)
    (if (good-enough? old-guess new-guess)
        new-guess
        (sqrt-iter new-guess (improve new-guess))))
  (sqrt-iter x 1.0))

(sqrt-manual 10000000000000)

; 2 1.414213562373095
; 2 1.4142135623746899
