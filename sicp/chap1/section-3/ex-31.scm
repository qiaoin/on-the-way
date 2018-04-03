; 返回给定范围中各点的某个函数值的乘积
; 递归实现
(define (produce-recursion term a next b)
  (if (> a b)
      1
      (* (term a)
         (produce-recursion term (next a) next b))))

; 迭代实现
(define (produce-iterator term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (identity x) x)

(define (inc x) (+ x 1))

; 使用 produce 定义阶乘
(define (factorial n)
  (produce-recursion identity 1 inc n))

(factorial 6)

; 使用 produce 定义练习1.31中的乘积
(define (odd? x) (= (remainder x 2) 1))  ; 奇数

(define (frac x)
  (if (odd? x)
      (/ (+ x 1) (+ x 2))
      (/ (+ x 2) (+ x 1))))

; (frac 1)
; (frac 2)
; (frac 3)
; (frac 4)

(define (calculate-pi n)
  (exact->inexact
    (* 4 (produce-iterator frac 1 inc n))))

(calculate-pi 1000000)
