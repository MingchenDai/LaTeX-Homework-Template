\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mdocs}[Testing]

\LoadClass[12pt,a4paper]{article}
%%% Fonts and Paragraphs%%%
% \RequirePackage{ctex} 中文支持？疑似xetex不用
% \RequirePackage{fontspec} % 先注释掉，鬼知道当时为啥引用
\RequirePackage[T1]{fontenc} % introduce times font family
\RequirePackage{mathptmx} % introduce times font family
\RequirePackage{amsmath} % 奇奇妙妙的数学公式支持
\RequirePackage{bm} % 引入斜体加粗\bm{}
\RequirePackage{listings} % 代码样式
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
    frame=none
}
\newcommand{\code}[1]{\lstinline[basicstyle=\ttfamily,keywordstyle=\color{blue}]|#1|} % 行间代码样式
\RequirePackage{indentfirst} % 章节首段缩进
\setlength{\parindent}{2em}

%%% Page Design %%%
\RequirePackage{geometry} % adjust scale of the page
\geometry{a4paper,scale=0.8} % 页面尺寸和显示比例
\RequirePackage{fancyhdr} % 页眉
\RequirePackage{lastpage} % 页码总数 需要二次编译
\pagestyle{fancy}
\setlength{\headheight}{15pt} %页眉高度
\setlength{\headsep}{5pt} % 页眉与文字距离
\setlength{\textheight}{744pt} % 文字部分高度
\setlength{\footskip}{15pt} % 页脚高度
\RequirePackage{xcolor} % 调色
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
%%% Images, Tables and Lists %%%
\usepackage{tikz} % 强大的绘图宏
\RequirePackage{float} % 控制图片位置
\RequirePackage{subcaption} % 为并排显示的图片呈现caption
\RequirePackage{graphicx}
\RequirePackage{enumitem} % 调整有序和无序列表样式
\newenvironment{itemlist}{
    \begin{itemize}[itemsep=0pt,topsep=1em,parsep=0pt,leftmargin=2em,labelsep=1em,itemindent=2em] 
}{
    \end{itemize}
}
\newenvironment{numlist}{
    \begin{enumerate}[itemsep=0pt,topsep=1em,parsep=0pt,leftmargin=2em,labelsep=1em,itemindent=2em] 
}{
    \end{enumerate}
}
\usepackage{booktabs} % 三线表

%%% File Information %%%

\date{\fileeditdate}
%%% Multiple Document Types %%%
\DeclareOption{homework-en}{
    \author{\fileauthor~\fileauthorserial}
    \title{\textbf{\filetitle}\\\large{Homework of \textbf{\coursename}~(\coursecode)}}
    \lhead{\textbf{\coursecode~\coursename}~Homework}
    \chead{}
    \rhead{\filetitle}
    \lfoot{\textcolor{gray}{\fileauthorserial~\fileauthor}}
    \cfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}
    \rfoot{\textcolor{gray}{\fileeditdate}}
    \fancypagestyle{plain}{
        \fancyhf{}
        \chead{}
        \lfoot{\textcolor{gray}{\fileauthorserial~\fileauthor}}
        \cfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}
        \rfoot{\textcolor{gray}{\fileeditdate}}
        \renewcommand{\headrulewidth}{0pt}
    }
}
\DeclareOption{article-en}{
    \author{\fileauthor\\\fileauthoracademy}
    \title{\textbf{\filetitle}\\\Large{\textit{\filesubtitle}}}
    \lhead{}
    \chead{\filetitle}
    \rhead{}
    \lfoot{\textcolor{gray}{\fileeditdate}}
    \cfoot{}
    \rfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}
    \fancypagestyle{plain}{
        \fancyhf{}
        \lfoot{\textcolor{gray}{\fileeditdate}}
        \cfoot{}
        \rfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}
        \renewcommand{\headrulewidth}{0pt}
    }
}
\ProcessOptions\relax