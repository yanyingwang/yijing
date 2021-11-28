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
