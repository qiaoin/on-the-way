(define (multi a b)
  (if (= b 0)
      0
      (+ a (multi a (- b 1)))))

(multi 4 5)

(define (double n) (+ n n))

(define (halve n) (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-multi a b)
  (cond ((= b 1) a)
        ((even? b) (fast-multi (double a) (halve b)))
        (else (+ a (fast-multi a (- b 1))))))

(fast-multi 4 3)

(fast-multi 6 5)

(fast-multi 15 15)
