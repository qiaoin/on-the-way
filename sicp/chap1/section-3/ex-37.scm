; 迭代实现
(define (cont-frac n d k)
  (define (iter count result)
    (if (= count 0)
        result
        (iter (- count 1) (/ (n count) (+ (d count) result)))))
  (iter k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

; 递归实现
