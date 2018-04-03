; 递归实现
(define (accumulate-recursion combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursion combiner null-value term (next a) next b))))

(define (sum-recursion term a next b)
  (accumulate-recursion (lambda (x y) (+ x y)) 0 term a next b))

(define (produce-recursion term a next b)
  (accumulate-recursion (lambda (x y) (* x y)) 1 term a next b))

;;; 测试递归实现
(define (inc x) (+ x 1))
(define (identity x) x)

(sum-recursion identity 1 inc 10)

(produce-recursion identity 1 inc 6)

; 迭代实现
(define (accumulate-iterator combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum-iterator term a next b)
  (accumulate-iterator (lambda (x y) (+ x y)) 0 term a next b))

(define (produce-iterator term a next b)
  (accumulate-iterator (lambda (x y) (* x y)) 1 term a next b))

;;; 测试迭代实现
(sum-iterator identity 1 inc 10)

(produce-iterator identity 1 inc 6)
