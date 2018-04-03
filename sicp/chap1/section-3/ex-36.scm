; 寻找函数的不动点
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          count
          (try next (+ count 1)))))
  (try first-guess 0))

; 求平方根
(define (sqrt x)
  (define (average m n) (/ (+ m n) 2))
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(sqrt 9)

; 确定 x^x = 1000 的一个根
; 不用平均阻尼
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
; 使用平均阻尼
(define (average x y) (/ (+ x y) 2))
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)
