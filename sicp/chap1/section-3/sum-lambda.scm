;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 1.3.1
; 求和运算
(define (cube x) (* x x x))

; 计算 a-b 的整数和
(define (sum-integers-0 a b)
  (if (> a b)
      0
      (+ a (sum-integers-0 (+ a 1) b))))

; 计算 a-b 之间整数的立方和
(define (sum-cubes-0 a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes-0 (+ a 1) b))))

; 计算序列和
(define (pi-sum-0 a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum-0 (+ a 4) b))))

; 求和的公共基础模式
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-cubes a b)
  (sum (lambda (x) (* x x x))
       a
       (lambda (x) (+ x 1))
       b))

(sum-cubes 1 10)

(define (sum-integers a b)
  (sum (lambda (x) x)
       a
       (lambda (x) (+ x 1))
       b))

(sum-integers 1 10)

(define (sum-pi a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(* 8 (sum-pi 1 1000))

(define (integral f a b dx)
  (* dx
     (sum f
          (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)))

(integral (lambda (x) (* x x x)) 0 1 0.00015)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 1.3.2
(define (square x) (* x x))

(define (f-0 x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

(define (f-1 x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(define (f-let x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

(define (f x y)
  (define a (+ 1 (* x y)))
  (define b (* x y))
  (+ (* x (square a))
     (* y b)
     (* a b)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 1.3.3
; 通过区间折半寻找方程的根
(define (positive? x) (> x 0))
(define (negative? x) (< x 0))
(define (close-enough? x y) (< (abs (- x y)) 0.001))
(define (search f neg-point pos-point)
  (define (average x y) (/ (+ x y) 2))
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value) (search f neg-point midpoint))
                ((negative? test-value) (search f midpoint pos-point))
                (else midpoint))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
            (newline)
            (display "Values are not of opposite sign. Please try it again!")))))

(half-interval-method sin 2.0 4.0)

(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1.0
                      2.0)

(half-interval-method (lambda (x) (* x x))
                      0
                      4.0)

; 寻找函数的不动点
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point cos 1.0)

(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)

(define (average x y) (/ (+ x y) 2))
(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(sqrt 9)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 1.3.4
; 牛顿法
(define dx 0.00001)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt-newton x)
  (newtons-method (lambda (y) (- (square y) x)) 1.0))

(sqrt-newton 9)

; 更一级抽象
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt-50-damp x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(sqrt-50-damp 9)

(define (sqrt-50-newton x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))

(sqrt-50-newton 9)
