#lang scribble/manual
@(require (for-label yijing
                     2htdp/image
                     racket/base)
           scribble/eval
           scribble-rainbow-delimiters)

@(define the-eval
         (make-eval-factory '(yijing)))

@script/rainbow-delimiters*


@title{Yijing Icons}
@author[(author+email "Yanying Wang" "yanyingwang1@gmail.com")]

@defmodule[yijing]
Chinese Yijing Icons/易经图标.
@table-of-contents[]


@examples[#:eval (the-eval)
(taijibagua)
]

@section{Prameters}
@defparam[current-yijing-size v (and/c real? (not/c negative?)) #:value 60]{
Set generated icons's default size.
}
@defparam[current-yijing-chinese-charaters v boolean? #:value #t]{
Set generated icons to whether include chinese charaters or not.
}


@section{Generating icons}

@subsection{Taijibagua/太极八卦图}
@defproc[(taijibagua) image?]{
Constructs Taijibagua/太极八卦图.
}

@subsection{Taiji/太极}
@defproc[(taiji [radius (and/c real? (not/c negative?))]) image?]{
Constructs taiji(太极).
@examples[#:eval (the-eval)
(taiji 50)
]
}
@subsection{Liangyi/两仪}
@deftogether[(
@defproc[(yin) image?]
@defproc[(yang) image?]
)]{
Constructs Yin/阴, Yang/阳.
@examples[#:eval (the-eval)
(yin)
(yang)
]
}


@subsection{Sixiang/四象}
@deftogether[(
@defproc[(taiyang) image?]
@defproc[(shaoyin) image?]
@defproc[(shaoyang) image?]
@defproc[(taiyin) image?]
)]{
Constructs Taiyang/太阳, Shaoyin/少阴, Shaoyang/少阳, Taiyin/太阴.
@examples[#:eval (the-eval)
(taiyang)
(shaoyin)
(shaoyang)
(taiyin)
]
}

@subsection{Bagua/八卦}
@deftogether[(
@defproc[(qian) image?]
@defproc[(dui) image?]
@defproc[(li) image?]
@defproc[(zhen) image?]
@defproc[(xun) image?]
@defproc[(kan) image?]
@defproc[(gen) image?]
@defproc[(kun) image?]
)]{
Constructs Qian/乾(天), Dui/兑(泽), Li/离(火), Zhen/震(雷), Xun/巽(风), Kan/坎(水), Gen/艮(山), Kun/坤(地).@linebreak{}
乾三连（☰），坤六断（☷）；@linebreak{}
震仰盂（☳），艮覆碗（☶）； @linebreak{}
离中虚（☲），坎中满（☵）；@linebreak{}
兑上缺（☱），巽下断（☴）。@linebreak{}
@examples[#:eval (the-eval)
(qian)
(dui)
(li)
(zhen)
(xun)
(kan)
(gen)
(kun)
]
}
