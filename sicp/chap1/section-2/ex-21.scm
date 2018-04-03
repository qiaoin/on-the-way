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


; 寻找数的最小因子
(define (smallest-divisor n)
  (define (find-divisor test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor (+ test-divisor 1)))))
  (find-divisor 2))

(smallest-divisor 199)  ; 199

(smallest-divisor 1999)  ; 1999

(smallest-divisor 19999)  ; 7
