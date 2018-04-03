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

; (define (make-rat n d)
;   (let ((g (gcd n d)))
;     (cons (/ n g) (/ d g))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define one-half (make-rat (- 1) (- 2)))

(print-rat one-half)

(define one-third (make-rat (- 1) 3))

(print-rat (add-rat one-half one-third))

(print-rat (mul-rat one-half one-third))

(print-rat (add-rat one-third one-third))
