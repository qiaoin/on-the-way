; 辅助过程
; 求两个整数的最大公约数
(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))
; 求绝对值
(define (abs x)
  (if (< x 0)
      (- x)
      x))
; 判断分子分母是否同号
(define (positive? n d)
  (> (* n d) 0))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (positive? n d)
        (cons (/ n g) (/ d g))
        (cons (- (/ (abs n) g)) (/ (abs d) g)))))
