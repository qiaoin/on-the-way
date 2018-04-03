(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (try guess)
      (let ((next (improve guess)))
        (if (good-enough? guess next)
            next
            (try next))))
    (try first-guess)))

; 辅助过程
(define (abs x)
  (if (< x 0)
      (- x)
      x))
(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

; 重写 sqrt 过程
(define (sqrt x)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) 0.0001))
  (define (improve guess)
    (average (/ x guess) guess))
  ((iterative-improve good-enough? improve) 1.0))

(sqrt 9)

; 重写 fixed-point 过程
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve close-enough? improve) first-guess))

(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)
