(define (square x) (* x x))

; random returns a pseudo-random number between zero (inclusive) and modulus (exclusive)
; 我们需要提供一个随机数生成，系统提供的 random [0, n)
; 现在需要不包括0
(define (non-zero-random n)
  (let ((r (random n)))
    (if (not (= r 0))
        r
        (non-zero-random n))))

(define (nontrivial-square-root? a n)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= (remainder (square a) n) 1)))

(define (expmod base exp m)
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= exp 0) 1)
        ((nontrivial-square-root? base m) 0)  ; 增加非平凡平方根检测
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (miller-robin-test n)
  (let ((times (ceiling (/ n 2))))
    (miller-robin-iter n times)))

(define (miller-robin-iter n times)
  (cond ((= times 0) #t)
        ((= (expmod (+ (random (- n 1)) 1) (- n 1) n) 1)
         (miller-robin-iter n (- times 1)))
        (else #f)))

; (define (miller-robin-test n)
;   (define (try-it a)
;     (= (expmod a (- n 1) n) 1))
;   (try-it (+ (random (- n 1)) 1)))

; (define (miller-robin-prime? n times)
;   (cond ((= times 0) #t)
;         ((miller-robin-test n) (miller-robin-prime? n (- times 1)))
;         (else #f)))

(miller-robin-test 1105)  ; #f

(miller-robin-test 53)  ; #t
