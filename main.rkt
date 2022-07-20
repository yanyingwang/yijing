#lang racket/base

(require 2htdp/image
         (file "private/dictionary.rkt"))
(provide (except-out
          (all-defined-out)
          append-text!
          append-text
          yao-height
          sixiang-offset
          bagua-offset))

(define current-yijing-size (make-parameter 60))
(define current-yijing-chinese-characters (make-parameter #t) )

(define (append-text! image name)
  (let* ([width (image-width image)]
         [height (image-height image)]
         [size (round (/ width 4)) ]
         [offset (+ (/ height 2) size)]
         [text (text (hash-ref table name) size "black")])
    (overlay/offset text 0 (- offset) image)))

(define (append-text img name)
  (if (current-yijing-chinese-characters)
      (append-text! img name)
      img))

(define (yao-height)
  (/ (current-yijing-size) 5))
(define (sixiang-offset)
  (* (yao-height) 1.5))
(define (bagua-offset)
  (* (yao-height) 2.25))


(define (taijibagua)
  (let* ([img (parameterize ([current-yijing-chinese-characters #f]) (taiji))]
         [img (above (qian) img)]
         [img (above (kun) (rotate 180 img))]
         [img (above (li) (rotate 90 img))]
         [img (above (kan) (rotate 180 img))]
         [img (overlay/offset (gen) 0 (* (current-yijing-size) 1.6) (rotate 45 img))]
         [img (overlay/offset (dui) 0 (* (current-yijing-size) 1.75) (rotate 180 img))]
         [img (overlay/offset (xun) 0 (* (current-yijing-size) 1.6) (rotate 90 img))]
         [img (overlay/offset (zhen) 0 (* (current-yijing-size) 1.75) (rotate 180 img))])
    (rotate 135 img)))

(define (taiji [r (current-yijing-size)])
  (let* ([r2 (/ r 2)]
         [r10 (/ r 10)]
         [img (overlay/align "left" "top"
                             (rotate 90 (wedge r 180 "solid" "white"))
                             (circle  r "solid" "black"))]
         [img (overlay/align/offset "right" "top"
                                    (rotate 270 (wedge r2 180 "solid" "white"))
                                    r2 0
                                    img)]
         [img (overlay/align/offset "right" "bottom"
                                    (rotate 90 (wedge r2 180 "solid" "black"))
                                    r 0
                                    img)]
         [img (overlay/align/offset "center" "center"
                                    (circle r10 "solid" "black")
                                    0 r2
                                    img)]
         [img (overlay/align/offset "center" "center"
                                    (circle r10 "solid" "white")
                                    0 (- r2)
                                    img)])
    (append-text img 'taiji)))


;; 两仪
(define (yin)
  (let* ([unit (/ (current-yijing-size) 10)]
         [h (* unit 2)]
         [w (* unit 4.5)]
         [offset (+ unit w)]
         [img (overlay/offset (rectangle w h "outline" "black")
                              offset 0
                              (rectangle w h "outline" "black"))])
    (append-text img 'yin)))

(define (yang)
  (let* ([h (/ (current-yijing-size) 5)]
         [w (current-yijing-size)]
         [img (rectangle w h "solid" "black")]) ;; Dark Brown
    (append-text img 'yang)))

;; 四象
(define (taiyang)
  (let ([img (parameterize ([current-yijing-chinese-characters #f])
               (overlay/offset (yang)
                               0 (sixiang-offset)
                               (yang)))])
    (append-text img 'taiyang)))
(define (shaoyin)
  (let ([img (parameterize ([current-yijing-chinese-characters #f])
               (overlay/offset (yin)
                               0 (sixiang-offset)
                               (yang)))])
    (append-text img 'shaoyin)))
(define (taiyin)
  (let ([img (parameterize ([current-yijing-chinese-characters #f])
               (overlay/offset (yin)
                               0 (sixiang-offset)
                               (yin)))])
    (append-text img 'taiyin)))
(define (shaoyang)
  (let ([img (parameterize ([current-yijing-chinese-characters #f])
               (overlay/offset (yang)
                               0 (sixiang-offset)
                               (yin)))])
    (append-text img 'shaoyang)))

;; 八卦
(define (qian)
  (let ([img (parameterize ([current-yijing-chinese-characters #f]) (overlay/offset (yang) 0 (bagua-offset) (taiyang)))])
    (append-text img 'qian)))
(define (dui)
  (let ([img (parameterize ([current-yijing-chinese-characters #f]) (overlay/offset (yin) 0 (bagua-offset) (taiyang)))])
    (append-text img 'dui)))
(define (li)
  (let ([img (parameterize ([current-yijing-chinese-characters #f]) (overlay/offset (yang) 0 (bagua-offset) (shaoyin)))])
    (append-text img 'li)))
(define (zhen)
  (let ([img (parameterize ([current-yijing-chinese-characters #f]) (overlay/offset (yin) 0 (bagua-offset) (shaoyin)))])
    (append-text img 'zhen)))
(define (xun)
  (let ([img (parameterize ([current-yijing-chinese-characters #f]) (overlay/offset (yang) 0 (bagua-offset) (shaoyang)))])
    (append-text img 'xun)))
(define (kan)
  (let ([img (parameterize ([current-yijing-chinese-characters #f]) (overlay/offset (yin) 0 (bagua-offset) (shaoyang)))])
    (append-text img 'kan)))
(define (gen)
  (let ([img (parameterize ([current-yijing-chinese-characters #f]) (overlay/offset (yang) 0 (bagua-offset) (taiyin)))])
    (append-text img 'gen)))
(define (kun)
  (let ([img (parameterize ([current-yijing-chinese-characters #f]) (overlay/offset (yin) 0 (bagua-offset) (taiyin)))])
    (append-text img 'kun)))
