(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (even? x)
  (= (remainder x 2) 0))

(define (inc x)
  (+ x 1))

(define (get-times-num k n)
  (cond ((or (= k 0) (= k n)) 1)
        ((even? k) 2)
        (else 4)))

(define (integral f a b n)
  (let ((h (/ (- b a) n)))
    (define (entity k)
      (* (get-times-num k n) (f (+ a (* k h)))))
    (* (/ h 3.0) (sum entity 0 inc n))))

(define (cube x) (* x x x))

(integral cube 0 1 100)

(integral cube 0 1 1000)
