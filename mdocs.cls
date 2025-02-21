\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mdocs}[Testing]

\LoadClass[12pt,a4paper]{article}
%%% Fonts %%%
% \usepackage{ctex} 中文支持？疑似xetex不用
% \RequirePackage{fontspec} % 先注释掉，鬼知道当时为啥引用
\RequirePackage[T1]{fontenc} % introduce times font family
\RequirePackage{mathptmx} % introduce times font family
\RequirePackage{amsmath} % 奇奇妙妙的数学公式支持
\RequirePackage{bm} % 引入斜体加粗\bm{}
\RequirePackage{listings} % include code style
\lstset{
    commentstyle=\color{red!50!green!50!blue!50},
    keywordstyle=\color{blue!70},
    numberstyle=\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2,
    frame=single
}
\newcommand{\code}[1]{\lstinline[basicstyle=\ttfamily,keywordstyle=\color{blue}]|#1|} % inline code

%%% Page Design %%%
\RequirePackage{geometry} % adjust scale of the page
\geometry{a4paper,scale=0.8}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage} % page index
