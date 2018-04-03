; 素数检测
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

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " -- prime")
  (display " *** ")
  (display elapsed-time))

; (timed-prime-test 13)

(define (odd? n)
  (= (remainder n 2) 1))

(define (search-for-primes begin end)
  (define (search-iter begin end)
    (cond ((> begin end)
           (newline)
           (display "reach the end!"))
          ((odd? begin)
           (timed-prime-test begin)
           (search-for-primes (+ begin 2) end))
          (else (search-for-primes (+ begin 1) end))))
  (search-iter begin end))

; (search-for-primes 1000 1100)

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

; (continue-primes 1000 3)

(define (search-primes n)
  (let ((start-time (real-time-clock)))
    (continue-primes n 3)
    (- (real-time-clock) start-time)))

; (search-primes 1000)  ; 1

; (search-primes 10000)  ; 3

; (search-primes 100000)  ; 4

; (search-primes 1000000)  ; 10

; 每次运行的结果都不一样！

(search-primes 10000)  ; 2

(search-primes 100000000)  ; 87

(search-primes 1000000000000)  ; 5736
