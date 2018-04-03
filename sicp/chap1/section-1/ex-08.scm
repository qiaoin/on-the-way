(define (square x) (* x x))

(square 3)

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(abs -9)

(define (sqrt-three x)
  (define (good-enough? old-guess new-guess)
    (< (/ (abs (- new-guess old-guess)) old-guess) 0.0000001))
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  (define (sqrt-three-iter old-guess new-guess)
    (newline)
    (display new-guess)
    (newline)
    (if (good-enough? old-guess new-guess)
        new-guess
        (sqrt-three-iter new-guess (improve new-guess))))
  (sqrt-three-iter x 1.0))

(sqrt-three 8)
