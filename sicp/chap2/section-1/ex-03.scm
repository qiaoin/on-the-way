(load "ex-02.scm")
(load "../../chap1/section-3/ex-46.scm")

(define (length seg)
  (let ((start-point (start-segment seg))
        (end-point (end-segment seg)))
    (sqrt (+ (square (- (x-point start-point) (x-point end-point)))
             (square (- (y-point start-point) (y-point end-point)))))))

; 1
; (define (make-rectangle x-seg y-seg)
;   (let ((x (length x-seg))
;         (y (length y-seg)))
;     (if (> x y)
;         (cons x y)
;         (cons y x))))

; 2
(define (make-rectangle x y)
  (if (> x y)
      (cons x y)
      (cons y x)))

(define (height rect)
  (car rect))

(define (width rect)
  (cdr rect))

; 周长
(define (circumference rect)
  (* 2 (+ (height rect) (width rect))))

; 面积
(define (area rect)
  (* (height rect) (width rect)))

(define x-start (make-point 0 0))
(define x-end (make-point 4 0))
(define x-seg (make-segment x-start x-end))

(define y-start (make-point 0 0))
(define y-end (make-point 0 8))
(define y-seg (make-segment y-start y-end))

; (define rect (make-rectangle x-seg y-seg))
(define rect (make-rectangle 8 4))

(height rect)

(width rect)

(circumference rect)

(area rect)
