(define (tan-cf x k)
  (define (square n) (* n n))
  (define (iter count result)
    (if (= count 1)
        (/ x (- 1 result))
        (iter (- count 1)
              (/ (square x) (- (- (* 2 count) 1) result)))))
  (iter k 0))

(tan-cf 0.7853981633974483 100)

(tan-cf 1.0471975511965976 100)
