% minicursoUFRB.csl
% Classe baseada no pacote NotesTeX.sty

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{minicursoUFRB}[2022/01/01 v.0.1.0 'Classe (não oficial) para apostila voltada a minicursos']

\ProcessOptions\relax
\LoadClass[12pt]{article}

% Pacotes carregados ==========================================================
\RequirePackage{Alegreya, AlegreyaSans}
\RequirePackage{fontspec}
  \setmonofont{UbuntuMono}
  [
    Path        = fonts/ubuntu-mono/,
    Extension   = .ttf,
    UprightFont = *-Regular
  ]

\RequirePackage{mathtools}
\RequirePackage{amsthm, amssymb, amscd}
\RequirePackage{bm}  
\RequirePackage[mdput, ttscaled = true, sfscaled = true]{mathdesign}

\RequirePackage[brazil]{babel}

\RequirePackage{marginnote}
\RequirePackage{sidenotes}

\RequirePackage{fancyhdr}

\RequirePackage{titlesec}

\RequirePackage{geometry}
  \geometry{
    paperheight    = 845pt,
    paperwidth     = 597pt,
    marginparsep   = 0.02\paperwidth,
    marginparwidth = 0.23\paperwidth,
    hoffset        = -1in, 
    voffset        = -1in, 
    headheight     = 0.02\paperheight,
    headsep        = 0.03\paperheight,
    footskip       = 20pt,
    textheight     = 0.84\paperheight,
    textwidth      = 0.64\paperwidth
  }

\RequirePackage[dvipsnames]{xcolor}
  \definecolor{douradoUFRB}{rgb}{0.929411765, 0.603921569, 0.066666667}
  \definecolor{azulUFRB}{rgb}{0.160784314, 0.08627451, 0.435294118}
\RequirePackage[many]{tcolorbox}

\RequirePackage[shortlabels]{enumitem}

\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{booktabs}

\RequirePackage{wrapfig}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{graphicx}
  \graphicspath{{./figs/}}

\RequirePackage{setspace}
\RequirePackage{multicol}

\RequirePackage{tikz}
  \definecolor[named]{color01}{rgb}{.2,.4,.6}
\RequirePackage{physics}
\RequirePackage{cancel}

\RequirePackage{microtype}

\RequirePackage{lipsum}

% ----------------------------------------------------------------------
%           User Page Prefrences 
% ----------------------------------------------------------------------
\DeclareGraphicsExtensions{.pdf,.png,.jpg}

\pagestyle{fancy}%
\newlength{\myoddoffset}%
\setlength{\myoddoffset}{\marginparwidth + \marginparsep}%
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}%
\renewcommand{\subsectionmark}[1]{\markright{#1}{}}%

\fancypagestyle{fancynotes}{%
  \fancyhf{}%
  \fancyheadoffset[rh]{\myoddoffset}%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyhead[L]{\textsc{\leftmark}}%
  \fancyhead[R]{\footnotesize \textit{\rightmark}~~~~ \thepage}%
}%

\fancypagestyle{fancypart}{%
  \fancyhf{}%
  \fancyfootoffset[rh]{\myoddoffset}%
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[L]{\footnotesize \thepage}%
}%

\titleformat{\part}[hang]{{\thispagestyle{fancypart}}\Huge\bfseries}{\marginnote{
\begin{tcolorbox}[width=\marginparwidth,height=\marginparwidth/2,colback=douradoUFRB,colframe=black!75!white,center title,fonttitle=\bfseries\normalsize,title=PARTE,text fill]
  \begin{center}
  {\color{white}\thepart}
  \end{center}
\end{tcolorbox}
}[-1.25in]}{0pt}{\sffamily\Huge\bfseries}

\newenvironment{fullpage}
    {\smallskip\noindent\begin{minipage}
    {\textwidth+\marginparwidth+\marginparsep}\hrule\smallskip\smallskip}
    {\hrule\end{minipage}\vspace{.1in}}

\newcommand{\mn}[1]{\textsuperscript{\thesidenote}{}\marginnote{\textsuperscript{\thesidenote}{}~\itshape\footnotesize #1}\refstepcounter{sidenote}}
\newcommand{\en}[1]{\marginnote{\footnotesize #1}}
\newcommand{\sn}[1]{\sidenote{\itshape\footnotesize #1}}

\RequirePackage[colorlinks=true
,urlcolor=blue
,anchorcolor=blue
,citecolor=blue
,filecolor=blue
,linkcolor=blue
,menucolor=blue
,linktocpage=true
,pdfproducer=medialab
,pdfa=true
]{hyperref}

% capa ------------------------------------------------------------------------
% comandos iniciais
\newcommand{\titulo}{\textsf{Uma Introdução (a jato)}\\ \textsf{ao} \LaTeX}
\newcommand{\autor}{Ícaro Vidal Freire}
\newcommand{\mini}{Minicurso}

\newcommand{\capa}{
\thispagestyle{empty} % limpa formatação da página

% colocando imagem de fundo
\tikz[remember picture, overlay] \node[opacity=1,inner sep=0pt] at (current page.center){\includegraphics[width=1.25\paperwidth,height=1.18\paperheight]{ink.jpg}};

% retângulo com os itens internos
\begin{tikzpicture}[remember picture,overlay]
  \node[rectangle, rounded corners, fill=white, opacity=0.75, anchor=south west, minimum width=8cm, minimum height=9cm] (box) at (0,-10) (box){};
  \node[anchor=west, color01, xshift=-3.0cm, yshift=-1.0cm, text width=5.9cm, font=\sffamily\Large] at (box.north){\mini}; 
  \node[anchor=west, color01, xshift=-3.0cm, yshift=-4.5cm, text width=5.9cm, font=\bfseries\Huge] at (box.north){\titulo};
  \node[anchor=west, color01, xshift=-3.0cm, yshift=-8.0cm, text width=5.9cm, font=\sffamily\LARGE] at (box.north){\autor};
\end{tikzpicture}

% nova página
\newpage
}


% Page layout
\renewcommand{\baselinestretch}{1.15}\normalsize
\setlength\lineskip{1\p@}
\setlength\parindent{1.2\parindent}
\setlength\normallineskip{1\p@}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\widowpenalty 1000
\clubpenalty 1000

\setcounter{topnumber}{4}
\renewcommand\topfraction{1}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.6}
\setcounter{totalnumber}{5}
\renewcommand\textfraction{0}
\renewcommand\floatpagefraction{1}
\addtolength\textheight{\topskip}

\marginparpush 6\p@
\topmargin   .05\paperheight

\setlength\arraycolsep{2\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

% No dots in the table of contents
\renewcommand{\@dotsep}{10000}

% Footer and header of the body
% the command ``\pagestyle{myplain}'' must be inserted
% just after ``\begin{document}''
\newcommand\ps@myplain{
\pagenumbering{arabic}
\renewcommand\@oddfoot{\hfill-- \thepage\ --\hfill}
\renewcommand\@oddhead{}}
\let\ps@plain=\ps@myplain



% no header or footer in the title page
\newcommand\ps@titlepage{\renewcommand\@oddfoot{}\renewcommand\@oddhead{}}



%number equations after the sections
\renewcommand{\theequation}{\thesection.\arabic{equation}}
\numberwithin{equation}{section}


%headings style

\renewcommand\section{\@startsection{section}{1}{\z@}%
                                   {-3.5ex \@plus -1.3ex \@minus -.7ex}%
                                   {2.3ex \@plus.4ex \@minus .4ex}%
                                   {\sffamily\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                   {-2.3ex\@plus -1ex \@minus -.5ex}%
                                   {1.2ex \@plus .3ex \@minus .3ex}%
                                   {\sffamily\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                   {-2.3ex\@plus -1ex \@minus -.5ex}%
                                   {1ex \@plus .2ex \@minus .2ex}%
                                   {\sffamily\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                   {1.75ex \@plus1ex \@minus.2ex}%
                                   {-1em}%
                                   {\sffamily\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                   {1.75ex \@plus1ex \@minus .2ex}%
                                   {-1em}%
                                   {\sffamily\normalsize\bfseries}}

%Caption of figure and table
\def\fnum@figure{\textbf{\figurename\nobreakspace\thefigure}}
\def\fnum@table{\textbf{\tablename\nobreakspace\thetable}}

%redefining \@makecaption, to have captions with \small font size
%taken from article.cls l.489--498
%the only differences are the ``\small '' commands added on two lines
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\small #1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    \small #1. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}





%apply some formatting on the biblio
%without redefining the whole env
\let\oldthebibliography=\thebibliography
\let\endoldthebibliography=\endthebibliography
\renewenvironment{thebibliography}[1]{%
\begin{oldthebibliography}{#1}%
\small%
\raggedright%
\setlength{\itemsep}{5pt plus 0.2ex minus 0.05ex}%
}%
{%
\end{oldthebibliography}%
}