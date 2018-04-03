; n<3, f(n) = n
; n>=3, f(n) = f(n-1) + 2f(n-2) + 3f(n-3)

; 递归计算
(define (f-recursion n)
  (if (< n 3)
      n
      (+ (f-recursion (- n 1))
         (* 2 (f-recursion (- n 2)))
         (* 3 (f-recursion (- n 3))))))

(f-recursion 0)  ; 0
(f-recursion 1)  ; 1
(f-recursion 2)  ; 2
(f-recursion 3)  ; 4
(f-recursion 4)  ; 11=4+4+3


; 迭代计算
(define (f-iteration n)
  (define (f-iter a b c count)
    (newline)
    (display a)
    (if (= count 0)
        a
        (f-iter b
                c
                (+ c (* 2 b) (* 3 a))
                (- count 1))))
  (f-iter 0 1 2 n))

(f-iteration 0)  ; 0
(f-iteration 1)  ; 1
(f-iteration 2)  ; 2
(f-iteration 3)  ; 4
(f-iteration 4)  ; 11=4+4+3
