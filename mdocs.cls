\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mdocs}[Testing]
\LoadClass[12pt,a4paper]{article}

%%% Set Options %%%
\newcommand{\lang}{cn}
\DeclareOption{en}{\renewcommand{\lang}{en}}
\DeclareOption{cn}{\renewcommand{\lang}{cn}}
\newcommand{\sjtu}{none}
\DeclareOption{none}{\renewcommand{\sjtu}{none}}
\DeclareOption{blue}{\renewcommand{\sjtu}{blue}}
\DeclareOption{red}{\renewcommand{\sjtu}{red}}
\newcommand{\type}{article}
\DeclareOption{thesis}{\renewcommand{\type}{thesis}}
\DeclareOption{article}{\renewcommand{\type}{article}}
\DeclareOption{homework}{\renewcommand{\type}{homework}}
% Unimplemeted % \DeclareOption{beamer}{\renewcommand{\type}{beamer}}
\newcommand{\watermark}{no-watermark}
\DeclareOption{no-watermark}{\renewcommand{\watermark}{no-watermark}}
\DeclareOption{watermark}{\renewcommand{\watermark}{watermark}}
\ProcessOptions

%%% Fonts and Paragraphs %%%
\RequirePackage{xifthen}
\RequirePackage{xparse}
\ifthenelse{\equal{\lang}{cn}}{
    \RequirePackage[slantfont, boldfont]{xeCJK}
    \RequirePackage{tocbibind}
    \renewcommand{\contentsname}{目录}
    \renewcommand{\listfigurename}{图片列表}
    \renewcommand{\listtablename}{表格列表}
    % Deprecated due to format % \RequirePackage{ctex}
}{}
\RequirePackage{fontspec}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx} 
\RequirePackage{amsmath}
\RequirePackage{bm}
\RequirePackage{listings}
\lstset{
    commentstyle=\color{red!50!green!50!blue!50},
    keywordstyle=\color{blue!70},
    numberstyle=\color{gray},
    stringstyle=\color{purple},
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
\newcommand{\code}[1]{\lstinline[basicstyle=\ttfamily,keywordstyle=\color{blue}]|#1|}
\RequirePackage{indentfirst}
\setlength{\parindent}{2em}
\RequirePackage{xcolor}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

%%% Page Design %%%
\ifthenelse{\equal{\watermark}{watermark}}{
    \ifthenelse{\equal{\sjtu}{red}}{
        \RequirePackage{background}
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
        \RequirePackage{background}
        \backgroundsetup{
            contents={
                \includegraphics[width=\linewidth]{vi/sjtu-vi-badge-blue.pdf}
            },
            scale=1,
            opacity=0.1,
            angle=0,
        }
    }{}
}{}
\RequirePackage{geometry}
\geometry{a4paper,scale=0.8}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\pagestyle{fancy}
\setlength{\headsep}{5pt}
\setlength{\footskip}{15pt}
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
    \newcommand{\homeworkhead}{}
    \newcommand{\homeworkauthor}{\fileauthor~\fileauthorserial}
    \ifthenelse{\equal{\lang}{cn}}{
        \renewcommand{\homeworkhead}{\coursecode~\textbf{\coursename} 课程作业}
        \cfoot{\textcolor{gray}{第\thepage 页~共\pageref{LastPage}页}}
    }{
        \renewcommand{\homeworkhead}{\coursecode~\textbf{\coursename} Homework}
        \cfoot{\textcolor{gray}{Page \thepage~of~\pageref{LastPage}}}            
    }
    \title{\textbf{\filetitle}\\\large{\homeworkhead}}
    \author{\homeworkauthor}
    \ifthenelse{\equal{\sjtu}{none}}{
        \lhead{\textcolor{gray}{\homeworkhead}}
        \rhead{\filetitle}
    }{
        \rhead{\textcolor{gray}{\homeworkhead}\\\filetitle}
    }
    \chead{}
    \lfoot{\textcolor{gray}{\homeworkauthor}}
    \rfoot{\textcolor{gray}{\fileeditdate}}
    \fancypagestyle{plain}{
        \fancyhf{}
        \chead{}
        \lfoot{\textcolor{gray}{\homeworkauthor}}
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
    \author{\ifthenelse{\equal{\fileauthor}{}}{
        \fileauthoracademy
    }{
        \fileauthor    
        \ifthenelse{\equal{\fileauthoracademy}{}}{}
        {
           \\\fileauthoracademy
        }
    }}
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
\ifthenelse{\equal{\type}{thesis}}{
    \author{\ifthenelse{\equal{\fileauthor}{}}{
        \fileauthoracademy
    }{
        \fileauthor    
        \ifthenelse{\equal{\fileauthoracademy}{}}{}
        {
           \\\fileauthoracademy
        }
    }}
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
        \lhead{\filetitle--\ifthenelse{\equal{\filesubtitle}{}}{}{\textit{\filesubtitle}}}
        \rhead{\leftmark}
    }{
        \chead{\filetitle\\\textit{\filesubtitle}}
        \rhead{\leftmark\\\rightmark}
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

%%% Images, Tables and Lists %%%
\usepackage{tikz}
\RequirePackage{float}
\RequirePackage{subcaption}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
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
\usepackage{booktabs}

%%% File Information %%%
\date{\fileeditdate}