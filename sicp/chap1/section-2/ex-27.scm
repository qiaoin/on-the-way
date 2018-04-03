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

(define (carmichael-test n)
  (define (report-result a)
    (newline)
    (if (= a n)
        (display a)
        (display "not carmichael number")))
  (define (try-it a)
    (= (expmod a n n) a))
  (define (carm-iter a)
    (if (and (< a n) (try-it a))
        (carm-iter (+ a 1))
        (report-result a)
        ))
  (carm-iter 2))

(carmichael-test 561)

(carmichael-test 1105)

(carmichael-test 1729)

(carmichael-test 2465)

(carmichael-test 2821)

(carmichael-test 6601)
