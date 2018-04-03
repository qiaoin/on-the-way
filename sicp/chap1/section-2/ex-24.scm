; (define true #t)
; (define false #f)

; (define (expmod base exp m)
;   (define (square x) (* x x))
;   (define (even? n) (= (remainder n 2) 0))
;   (cond ((= exp 0) 1)
;         ((even? exp)
;          (remainder (square (expmod base (/ exp 2) m))
;                     m))
;         (else
;           (remainder (* base (expmod base (- exp 1) m))
;                      m))))

; (define (fermat-test n)
;   (define (try-it a)
;     (= (expmod a n n) a))
;   (try-it (+ (random (- n 1)) 1)))

; (define (fast-prime? n times)
;   (cond ((= times 0) true)
;         ((fermat-test n) (fast-prime? n (- times 1)))
;         (else false)))

(load "factorial.scm")

(define (next-odd n)
  (if (odd? n)
      (+ n 2)
      (+ n 1)))

(define (continue-primes n count)
  (cond ((= count 0)
         (newline)
         (display "They are all primes."))
        ((fast-prime? n 6)
         (newline)
         (display n)
         (continue-primes (next-odd n) (- count 1)))
        (else
          (continue-primes (next-odd n) count))))

(define (search-primes n)
  (let ((start-time (real-time-clock)))
    (continue-primes n 3)
    (- (real-time-clock) start-time)))

; (search-primes 1000)  ; 2

; (search-primes 10000)  ; 4

; (search-primes 100000)  ; 4

; (search-primes 1000000)  ; 6

(search-primes 10000)  ; 4

(search-primes 100000000)  ; 7

(search-primes 1000000000000)  ; 13

(search-primes 1000000000000000)  ; 24
