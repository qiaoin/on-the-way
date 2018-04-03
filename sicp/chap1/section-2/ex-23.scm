; 素数检测
(define (square x) (* x x))
(define (divides? a b) (= (remainder b a) 0))
(define (next x)
  (if (= x 2)
      3
      (+ x 2)))
(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor test-divisor)
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor (next test-divisor)))))
    (find-divisor 2))
  (= n (smallest-divisor n)))

(define (next-odd n)
  (if (odd? n)
      (+ n 2)
      (+ n 1)))

(define (continue-primes n count)
  (cond ((= count 0)
         (newline)
         (display "They are all primes."))
        ((prime? n)
         (newline)
         (display n)
         (continue-primes (next-odd n) (- count 1)))
        (else
          (continue-primes (next-odd n) count))))

(define (search-primes n)
  (let ((start-time (real-time-clock)))
    (continue-primes n 3)
    (- (real-time-clock) start-time)))

(search-primes 1000)  ; 1

(search-primes 10000)  ; 1

(search-primes 100000)  ; 2

(search-primes 1000000)  ; 5
