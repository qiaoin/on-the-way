(define (accumulate-recursion combiner filter? null-value term a next b)
  (cond ((> a b) null-value)
        ((filter? a) (combiner (term a)
                               (accumulate-recursion combiner
                                                     filter?
                                                     null-value
                                                     term (next a) next b)))
        (else (accumulate-recursion combiner
                                    filter?
                                    null-value
                                    term (next a) next b))))

(define (smallest-divisor n)
  (define (square x) (* x x))
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (identity x) x)

(define (inc x) (+ x 1))

; 计算 [a, b] 间所有素数的和
(define (sum-prime a b)
  (accumulate-recursion (lambda (x y) (+ x y))
                        prime?
                        0
                        identity
                        a
                        inc
                        b))

(sum-prime 2 11)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; 小于 n 的所有与 n 互素的正整数乘积
(define (sum-relatively-prime n)
  (define (relatively-prime? i)
    (= 1 (gcd i n)))
  (accumulate-recursion (lambda (x y) (* x y))
                        relatively-prime?
                        1
                        identity
                        1
                        inc
                        (- n 1)))

(sum-relatively-prime 7)
