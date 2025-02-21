\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mdocs}[Testing]
\LoadClass[12pt,a4paper]{article}

%%% Set Options %%%
\newcommand{\lang}{cn}
\newcommand{\sjtu}{none}
\newcommand{\type}{article}
\DeclareOption{en}{\renewcommand{\lang}{en}}
\DeclareOption{cn}{\renewcommand{\lang}{cn}}
\DeclareOption{report}{\renewcommand{\type}{report}}
\DeclareOption{article}{\renewcommand{\type}{article}}
\DeclareOption{homework}{\renewcommand{\type}{homework}}
\DeclareOption{beamer}{\renewcommand{\type}{beamer}}
\DeclareOption{none}{\renewcommand{\sjtu}{none}}
\DeclareOption{blue}{\renewcommand{\sjtu}{blue}}
\DeclareOption{red}{\renewcommand{\sjtu}{red}}
\ProcessOptions

%%% Fonts and Paragraphs%%%
\RequirePackage{ifthen}
\ifthenelse{\equal{\lang}{cn}}{\RequirePackage[UTF8]{ctex}}{}
\RequirePackage{fontspec} % 先注释掉，鬼知道当时为啥引用
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
\RequirePackage{background} % 水印
\ifthenelse{\equal{\sjtu}{red}}{
    \backgroundsetup{
        contents={
            \includegraphics[width=\linewidth]{vi/sjtu-vi-badge-red.pdf}
        },
        scale=1,
        opacity=0.1,
        angle=0,
    }
}{}
\ifthenelse{\equal{\sjtu}{blue}}{
    \backgroundsetup{
        contents={
            \includegraphics[width=\linewidth]{vi/sjtu-vi-badge-blue.pdf}
        },
        scale=1,
        opacity=0.1,
        angle=0,
    }
}{}
\ifthenelse{\equal{\sjtu}{none}}{
    \backgroundsetup{
        contents={},
        scale=1,
        opacity=0.1,
        angle=0,
    }
}{}
\RequirePackage{geometry} % adjust scale of the page
\geometry{a4paper,scale=0.8} % 页面尺寸和显示比例
\RequirePackage{fancyhdr} % 页眉
\RequirePackage{lastpage} % 页码总数 需要二次编译
\pagestyle{fancy}
\setlength{\headsep}{5pt} % 页眉与文字距离
\setlength{\footskip}{15pt} % 页脚高度
\ifthenelse{\equal{\sjtu}{none}}{
    \setlength{\headheight}{15pt}
    \setlength{\textheight}{740pt}
}{
    \setlength{\headheight}{35pt}
    \setlength{\textheight}{720pt}
    \ifthenelse{\equal{\sjtu}{red}}{
        \lhead{
            \includegraphics[height=30pt]{vi/sjtu-vi-logo-red.pdf}
        }
    }{
        \lhead{
            \includegraphics[height=30pt]{vi/sjtu-vi-logo-blue.pdf}
        }
    }
}
\ifthenelse{\equal{\type}{homework}}{
    \author{\fileauthor~\fileauthorserial}
    \ifthenelse{\equal{\lang}{cn}}{
        \title{\textbf{\filetitle}\\\large{\textbf{\coursename}~(\coursecode) 课程作业}}
        \ifthenelse{\equal{\sjtu}{none}}{
            \lhead{\textcolor{gray}{\textbf{\coursecode~\coursename}~课程作业}}
            \rhead{\filetitle}
        }{
            \rhead{\textcolor{gray}{\textbf{\coursecode~\coursename}~课程作业}\\\filetitle}
        }
        \cfoot{\textcolor{gray}{第\thepage 页~共\pageref{LastPage}页}}
    }{
        \title{\textbf{\filetitle}\\\large{Homework of \textbf{\coursename}~(\coursecode)}}
        \ifthenelse{\equal{\sjtu}{none}}{
            \lhead{\textcolor{gray}{\textbf{\coursecode~\coursename}~Homework}}
            \rhead{\filetitle}
        }{
            \rhead{\textcolor{gray}{\textbf{\coursecode~\coursename}~Homework}\\\filetitle}
        }
        \cfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}            
    }
    \chead{}
    \lfoot{\textcolor{gray}{\fileauthorserial~\fileauthor}}
    \rfoot{\textcolor{gray}{\fileeditdate}}
    \fancypagestyle{plain}{
        \fancyhf{}
        \chead{}
        \lfoot{\textcolor{gray}{\fileauthorserial~\fileauthor}}
        \ifthenelse{\equal{\lang}{cn}}{
            \cfoot{\textcolor{gray}{第\thepage 页~共\pageref{LastPage}页}}
        }{
            \cfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}      
        }
        \rfoot{\textcolor{gray}{\fileeditdate}}
        \renewcommand{\headrulewidth}{0pt}
    }
}{}
\ifthenelse{\equal{\type}{article}}{
    \author{\fileauthor\\\fileauthoracademy}
    \title{\textbf{\filetitle}\ifthenelse{\equal{\filesubtitle}{}}{}{
        \\\Large{\textit{\filesubtitle}}
    }}
    \ifthenelse{\equal{\lang}{cn}}{
        \rfoot{\textcolor{gray}{第\thepage 页~共\pageref{LastPage}页}}
    }{
        \rfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}
    }
    \chead{}
    \lfoot{\textcolor{gray}{\fileeditdate}}
    \cfoot{}
    \ifthenelse{\equal{\sjtu}{none}}{
        \lhead{\filetitle}
        \rhead{\textit{\filesubtitle}}
    }{
        \rhead{\filetitle\\\textit{\filesubtitle}}
    }
    \fancypagestyle{plain}{
        \fancyhf{}
        \chead{}
        \cfoot{}
        \lfoot{\textcolor{gray}{\fileeditdate}}
        \ifthenelse{\equal{\lang}{cn}}{
            \rfoot{\textcolor{gray}{第\thepage 页~共\pageref{LastPage}页}}
        }{
            \rfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}
        }
        \renewcommand{\headrulewidth}{0pt}
    }
}{}
\RequirePackage{xcolor} % 调色
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\definecolor{sjtured}{HTML}{C8171E}

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

% \ifx\sjtu\blue
%     \setlength{\headheight}{30pt} %页眉高度
%     \lhead{ 
%         \includegraphics[height=30pt]{vi/sjtu-vi-logo-small-red.pdf}
%     }
%     \SetWatermarkText{\includegraphics[width=\textwidth]{vi/sjtu-vi-badge-red.pdf}}         % 设置水印logo
%     \SetWatermarkLightness{0}             % 设置水印透明度 0-1
%     \SetWatermarkScale{1}                   % 设置水印大小 0-1  
% \elifx\sjtu\red
%     \setlength{\headheight}{30pt} %页眉高度
%     \lhead{ 
%         \includegraphics[height=30pt]{vi/sjtu-vi-logo-small-red.pdf}
%     }
%     \SetWatermarkText{\includegraphics[width=\textwidth]{vi/sjtu-vi-badge-red.pdf}}         % 设置水印logo
%     \SetWatermarkLightness{0}             % 设置水印透明度 0-1
%     \SetWatermarkScale{1}                   % 设置水印大小 0-1  
% \else
% \setlength{\headheight}{15pt}
% \fi
% \ifx\type\homework
%     \author{\fileauthor~\fileauthorserial}
%     \ifx\lang\cn
%         \title{\textbf{\filetitle}\\\large{\textbf{\coursename}~(\coursecode) 课程作业}}
%         \rhead{\textcolor{gray}{\textbf{\coursecode~\coursename}~课程作业}\\\filetitle}
%         \cfoot{\textcolor{gray}{第\thepage 页 共\pageref{LastPage}页}}
%     \else
%         \title{\textbf{\filetitle}\\\large{Homework of \textbf{\coursename}~(\coursecode)}}
%         
%         \cfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}
%     \fi
%     \lhead{}
%     \chead{}
%     \lfoot{\textcolor{gray}{\fileauthorserial~\fileauthor}}
%     \rfoot{\textcolor{gray}{\fileeditdate}}
%     \fancypagestyle{plain}{
%         \fancyhf{}
%         \chead{}
%         \lfoot{\textcolor{gray}{\fileauthorserial~\fileauthor}}
%         \ifx\lang\cn
%             \cfoot{\textcolor{gray}{第\thepage 页 共\pageref{LastPage}页}}
%         \else    
%             \cfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}
%         \fi
%         \rfoot{\textcolor{gray}{\fileeditdate}}
%         \renewcommand{\headrulewidth}{0pt}
%     }
% \elifx\type\article
%     \author{\fileauthor\\\fileauthoracademy}
%     \title{\textbf{\filetitle}
%         \ifx\filesubtitle\1
%             \\\Large{\textit{\filesubtitle}}
%         \fi
%     }
%     \lhead{}
%     \chead{}
%     \rhead{\filetitle\\\textit{\filesubtitle}}
%     \lfoot{\textcolor{gray}{\fileeditdate}}
%     \cfoot{}
%     \ifx\lang\cn
%         \rfoot{\textcolor{gray}{第\thepage 页 共\pageref{LastPage}页}}
%     \else
%         \rfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}
%     \fi
%     \fancypagestyle{plain}{
%         \fancyhf{}
%         \lfoot{\textcolor{gray}{\fileeditdate}}
%         \cfoot{}
%         \ifx\lang\cn
%             \rfoot{\textcolor{gray}{第\thepage 页 共\pageref{LastPage}页}}
%         \else
%             \rfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}
%         \renewcommand{\headrulewidth}{0pt}
%     }
% \else
% \fi
