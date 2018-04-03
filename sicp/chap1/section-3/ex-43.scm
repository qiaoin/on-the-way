(define (compose g f)
  (lambda (x) (g (f x))))

; 递归实现
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

; 迭代实现
(define (repeated-iterator f n)
  (define (iter count result)
    (if (= count 1)
        result
        (iter (- count 1) (compose f result))))
  (iter n f))

(define (square x) (* x x))

((repeated square 2) 5)
