(define (even? n)
  (= (remainder n 2) 0))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (fast-multi-iteration a b)
  (define (multi-iter a b product)
    (cond ((= b 0) product)
          ((even? b) (multi-iter (double a) (halve b) product))
          (else (multi-iter a (- b 1) (+ product a)))))
  (multi-iter a b 0))

(fast-multi-iteration 4 5)

(fast-multi-iteration 3 6)

(fast-multi-iteration 2 0)
