(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))

(define (fast-expt-iteration b n)
  (define (expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (expt-iter (square b) (/ n 2) a))
          (else (expt-iter b (- n 1) (* a b)))))
  (expt-iter b n 1))

(fast-expt-iteration 2 0)

(fast-expt-iteration 2 10)

(fast-expt-iteration 2 5)
