; 定义点，一个点用数的序对表示
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

; 一个线段用一对点表示
(define (make-segment start end)
  (cons start end))

(define (start-segment start)
  (car start))

(define (end-segment end)
  (cdr end))

(define (average x y)
  (/ (+ x y) 2.0))

(define (midpoint-segment seg)
  (let ((start-point (start-segment seg))
        (end-point (end-segment seg)))
    (make-point (average (x-point start-point) (x-point end-point))
                (average (y-point start-point) (y-point end-point)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define start (make-point 1 1))

(define end (make-point 4 4))

(define seg (make-segment start end))

(print-point (midpoint-segment seg))
