;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 1.2.1
; 计算阶乘
; 递归实现
(define (factorial-recursion n)
  (if (= n 1)
      1
      (* n (factorial-recursion (- n 1)))))

(factorial-recursion 6)

; 迭代实现
(define (factorial-iteration n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* product counter)
              (+ counter 1))))
  (iter 1 1))

(factorial-iteration 6)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 1.2.2
; 计算斐波拉契数列
; 树形递归
(define (fib-tree-recursion n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-tree-recursion (- n 1))
                 (fib-tree-recursion (- n 2))))))

(fib-tree-recursion 5)

; 迭代计算
(define (fib-iteration n)
  (define (iter a b counter)
    (if (= counter 0)
        b
        (iter (+ a b) a (- counter 1))))
  (iter 1 0 n))

(fib-iteration 5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 换零钱方式的统计
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (count-change amount)
  (define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kinds-of-coins 0)) 0)
          (else (+ (cc amount (- kinds-of-coins 1))
                   (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))
  (cc amount 5))

(count-change 100)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 1.2.4
; 求幂
(define (expt-r b n)
  (if (= n 0)
      b
      (* b (expt b (- n 1)))))

(expt-r 2 3)

(define (expt-i b n)
  (define (expt-iter b counter product)
    (if (= counter 0)
        product
        (expt-iter b (- counter 1) (* product b))))
  (expt-iter b n 1))

(expt-i 2 3)

; 对2的乘幂
(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(fast-expt 2 8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 1.2.5
; 求最大公约数GCD
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 16 28)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 1.2.6
; 从2开始的连续整数去检查它们能否整除n
(define (square x) (* x x))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor test-divisor)
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor (+ test-divisor 1)))))
    (find-divisor 2))
  (= n (smallest-divisor n)))

(prime? 29)

; 费马检测
; 计算一个数的幂并对另一个数取模的结果
(define (expmod base exp m)
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))


;;; MIT\Scheme 里面已经提供了 random 函数

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ (random (- n 1)) 1)))

(define true #t)
(define false #f)

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 19 5)

(fast-prime? 1105 10)
