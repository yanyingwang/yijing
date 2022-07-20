884
((3) 0 () 1 ((q lib "yijing/main.rkt")) () (h ! (equal) ((c def c (c (? . 0) q kun)) q (801 . 2)) ((c def c (c (? . 0) q zhen)) q (688 . 2)) ((c def c (c (? . 0) q taiyin)) q (573 . 2)) ((c def c (c (? . 0) q li)) q (661 . 2)) ((c def c (c (? . 0) q gen)) q (773 . 2)) ((c def c (c (? . 0) q qian)) q (604 . 2)) ((c def c (c (? . 0) q shaoyin)) q (508 . 2)) ((c def c (c (? . 0) q yin)) q (419 . 2)) ((c def c (c (? . 0) q taiji)) q (331 . 3)) ((c def c (c (? . 0) q kan)) q (745 . 2)) ((c def c (c (? . 0) q taiyang)) q (476 . 2)) ((c def c (c (? . 0) q yang)) q (447 . 2)) ((c def c (c (? . 0) q current-yijing-size)) q (0 . 5)) ((c def c (c (? . 0) q dui)) q (633 . 2)) ((c def c (c (? . 0) q xun)) q (717 . 2)) ((c def c (c (? . 0) q taijibagua)) q (296 . 2)) ((c def c (c (? . 0) q current-yijing-chinese-charaters)) q (161 . 5)) ((c def c (c (? . 0) q shaoyang)) q (540 . 2))))
parameter
(current-yijing-size) -> (and/c real? (not/c negative?))
(current-yijing-size v) -> void?
  v : (and/c real? (not/c negative?))
 = 60
parameter
(current-yijing-chinese-charaters) -> boolean?
(current-yijing-chinese-charaters v) -> void?
  v : boolean?
 = #t
procedure
(taijibagua) -> image?
procedure
(taiji radius) -> image?
  radius : (and/c real? (not/c negative?))
procedure
(yin) -> image?
procedure
(yang) -> image?
procedure
(taiyang) -> image?
procedure
(shaoyin) -> image?
procedure
(shaoyang) -> image?
procedure
(taiyin) -> image?
procedure
(qian) -> image?
procedure
(dui) -> image?
procedure
(li) -> image?
procedure
(zhen) -> image?
procedure
(xun) -> image?
procedure
(kan) -> image?
procedure
(gen) -> image?
procedure
(kun) -> image?
