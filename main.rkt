#lang racket/base

(module+ test
  (require rackunit))

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included LICENSE-MIT and LICENSE-APACHE files.
;; If you would prefer to use a different license, replace those files with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html


(require 2htdp/image)
(provide (all-defined-out))

(define (taiji r)
  (let* ([r2 (/ r 2)]
         [r10 (/ r 10)]
         [pic (overlay/align "left" "top"
                             (rotate 90 (wedge r 180 "solid" "white"))
                             (circle  r "solid" "black"))]
         [pic (overlay/align/offset "right" "top"
                                    (rotate 270 (wedge r2 180 "solid" "white"))
                                    r2 0
                                    pic)]
         [pic (overlay/align/offset "right" "bottom"
                                    (rotate 90 (wedge r2 180 "solid" "black"))
                                    r 0
                                    pic)]
         [pic (overlay/align/offset "center" "center"
                                    (circle r10 "solid" "black")
                                    0 r2
                                    pic)])
    (overlay/align/offset "center" "center"
                          (circle r10 "solid" "white")
                          0 (- r2)
                          pic)))

;; 两仪
(define (yin)
  (overlay/offset (rectangle 20 10 "solid" "black") 30 0 (rectangle 20 10 "solid" "black")))
(define (yang)
  (rectangle 50 10 "solid" "Dark Brown"))

;; 四象
(define (taiyang)
  (overlay/offset (yang) 0 20 (yang)))
(define (shaoyin)
  (overlay/offset (yin) 0 20 (yang)))
(define (taiyin)
  (overlay/offset (yin) 0 20 (yin)))
(define (shaoyang)
  (overlay/offset (yang) 0 20 (yin)))

;; 八卦
(define (qian)
  (overlay/offset (yang) 0 30 (taiyang)))
(define (dui)
  (overlay/offset (yin) 0 30 (taiyang)))
(define (li)
  (overlay/offset (yang) 0 30 (shaoyin)))
(define (zhen)
  (overlay/offset (yin) 0 30 (shaoyin)))
(define (xun)
  (overlay/offset (yang) 0 30 (shaoyang)))
(define (kan)
  (overlay/offset (yin) 0 30 (shaoyang)))
(define (gen)
  (overlay/offset (yang) 0 30 (taiyin)))
(define (kun)
  (overlay/offset (yin) 0 30 (taiyin)))







(module+ test
  ;; Any code in this `test` submodule runs when this file is run using DrRacket
  ;; or with `raco test`. The code here does not run when this file is
  ;; required by another module.

  (check-equal? (+ 2 2) 4))

(module+ main
  ;; (Optional) main submodule. Put code here if you need it to be executed when
  ;; this file is run using DrRacket or the `racket` executable.  The code here
  ;; does not run when this file is required by another module. Documentation:
  ;; http://docs.racket-lang.org/guide/Module_Syntax.html#%28part._main-and-test%29

  (require racket/cmdline)
  (define who (box "world"))
  (command-line
    #:program "my-program"
    #:once-each
    [("-n" "--name") name "Who to say hello to" (set-box! who name)]
    #:args ()
    (printf "hello ~a~n" (unbox who))))
