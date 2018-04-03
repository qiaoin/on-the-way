(define (expt b n)
  (define (iter b counter result)
    (if (= counter 0)
        result
        (iter b (- counter 1) (* b result))))
  (iter b n 1))

(define (cons-five a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car-five z)
  (if (= (remainder z 2) 0)
      (+ 1 (car-five (/ z 2)))
      0))

(define (cdr-five z)
  (if (= (remainder z 3) 0)
      (+ 1 (cdr-five (/ z 3)))
      0))

(define z (cons-five 3 2))

(car-five z)

(cdr-five z)
