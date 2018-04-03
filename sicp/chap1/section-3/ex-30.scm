;; 递归实现
(define (sum-recursion term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-recursion term (next a) next b))))

;; 迭代实现
(define (sum-iteration term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(sum-iteration (lambda (x) x) 1 (lambda (x) (+ x 1)) 10)

(sum-iteration (lambda (x) (* x x x)) 1 (lambda (x) (+ x 1)) 10)

(* 8 (sum-iteration (lambda (x) (/ 1.0 (* x (+ x 2))))
               1
               (lambda (x) (+ x 4))
               1000))
