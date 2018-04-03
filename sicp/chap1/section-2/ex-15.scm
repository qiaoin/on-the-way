(define (cube x) (* x x x))

(define (p x)
  ; (newline)
  ; (display "+1")
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (newline)
  (display angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)
