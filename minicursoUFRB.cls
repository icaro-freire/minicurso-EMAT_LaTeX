% minicursoUFRB.csl
% Classe baseada no pacote NotesTeX.sty

% Estruturações Iniciais da Classe ============================================
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
\RequirePackage{quoting}

\newenvironment{cita}{
  \begin{quoting}[rightmargin=0cm,leftmargin=0.4\linewidth]
  \begin{singlespace}
    \small
}{
  \end{singlespace}
  \end{quoting}
}

\RequirePackage[dvipsnames]{xcolor}
  \definecolor{douradoUFRB}{rgb}{0.929411765, 0.603921569, 0.066666667}
  \definecolor{azulUFRB}{rgb}{0.160784314, 0.08627451, 0.435294118}
\RequirePackage[many]{tcolorbox}
  \tcbuselibrary{most}

\RequirePackage[shortlabels]{enumitem}

\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{fancybox}

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
\RequirePackage{siunitx}
\RequirePackage{cancel}
\RequirePackage{ulem}

\RequirePackage[style=abnt]{biblatex} %-------------------------> para bibliografia
  \addbibresource{bib/biblatex-abnt.bib} %-> adiciona o arquivo da bibliografia

\RequirePackage{microtype}

\RequirePackage{lipsum}

\RequirePackage{indentfirst}

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
  \fancyfoot[L]{\footnotesize \thepage}% ---------------------------------------> black!75!white
}%

\titleformat{\part}[hang]{{\thispagestyle{fancypart}}\Huge\bfseries}{\marginnote{
\begin{tcolorbox}[width=\marginparwidth,height=\marginparwidth/2,colback=douradoUFRB,colframe=azulUFRB,center title,fonttitle=\bfseries\normalsize,title=PARTE,text fill]
  \begin{center}
  {\color{white}\thepart}
  \end{center}
\end{tcolorbox}
}[-1.25in]}{0pt}{\sffamily\Huge\bfseries\color{azulUFRB}}

\newenvironment{fullpage}
    {\smallskip\noindent\begin{minipage}
    {\textwidth+\marginparwidth+\marginparsep}\hrule\smallskip\smallskip}
    {\hrule\end{minipage}\vspace{.1in}}

\newcommand{\mn}[1]{\textsuperscript{\thesidenote}{}\marginnote{\textsuperscript{\thesidenote}{}~\itshape\footnotesize #1}\refstepcounter{sidenote}}
\newcommand{\en}[1]{\marginnote{\footnotesize #1}}
\newcommand{\sn}[1]{\sidenote{\itshape\footnotesize #1}}

\RequirePackage[colorlinks=true
,urlcolor=douradoUFRB
,anchorcolor=azulUFRB
,citecolor=azulUFRB
,filecolor=azulUFRB
,linkcolor=azulUFRB
,menucolor=azulUFRB
,linktocpage=true
,pdfproducer={LuaLaTeX}
,pdfcreator={VSCode, arara}
,pdftitle={Uma Introdução (a jato) ao LaTeX}
,pdfauthor={Ícaro Vidal Freire}
,pdfsubject={Minicurso ofertado no EMAT do CFP/UFRB}
,pdfkeywords={latex, lualatex, arara, math, minicurso, ufrb}
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
  \node[anchor=west, azulUFRB, xshift=-3.0cm, yshift=-1.0cm, text width=5.9cm, font=\sffamily\Large] at (box.north){\mini}; 
  \node[anchor=west, azulUFRB, xshift=-3.0cm, yshift=-4.5cm, text width=5.9cm, font=\bfseries\Huge] at (box.north){\titulo};
  \node[anchor=west, azulUFRB, xshift=-3.0cm, yshift=-8.0cm, text width=5.9cm, font=\sffamily\LARGE] at (box.north){\autor};
\end{tikzpicture}

% nova página
\newpage
}

% configurações de códigos ====================================================
% criando uma caixa de avisos -------------------------------------------------
\newtcolorbox[auto counter,number within=section]{aviso}[1][]{
   enhanced jigsaw,
   colback   = white,
   colframe  = red,
   coltitle  = red,
   fonttitle = \bfseries\sffamily,
   sharp corners,
   detach title,
   leftrule  = 22mm,
   underlay unbroken and first={%
     \node[below,text=black,anchor=east] at ([xshift=-22.5pt]interior.base west) {\Huge  \textbf{!}};
    }, 
   breakable,
   pad at break = 1mm,
   #1,
   code={\ifdefempty{\tcbtitletext}{}{\tcbset{before upper={\tcbtitle\par\medskip}}}},
  }

% Configurando caixa para códigos ---------------------------------------------
%% icone do lapis
\newcommand{\lapis}[1]{%
  \begin{scope}[
    y=0.80pt,
    x=0.80pt,
    yscale=-1.000000,
    xscale=1.000000,
    inner sep=0pt,
    outer sep=0pt,
    shift={([xshift=0.35em, yshift=0.31em]frame.north west)},
    scale=.11
  ]

    \path[fill=#1!5] (104.4280,104.4280) circle (2.9472cm);
    \begin{scope}[shift={(-46.08801,-45.37)}]
      \path[fill=#1] (113.9190,187.9100) -- (127.1980,200.4160) --
        (109.7220,205.6600) -- (92.2560,210.9060) -- (96.4470,193.1470) --
        (100.6380,175.3930) -- cycle;
      \path[fill=#1] (133.3760,194.1100) -- (106.7160,169.1000) --
        (182.1210,88.6910) -- (208.7790,113.7040) -- cycle;
    \end{scope}
  \end{scope}%
}

%% caixa de código
% 1 -> título
% 2 -> icone do lápis
\newtcblisting{codigo}[2]{
  adjusted title=#1,
  adjusted title after break={\centering #1 (cont.)},
  halign title=center,
  fonttitle=\bfseries\sffamily,
  enhanced,
  drop lifted shadow,
  colback=azulUFRB!5,
  colframe=azulUFRB,
  breakable,
  overlay={#2{azulUFRB}},
  toptitle=0.2em,
  bottomtitle=.2em,
  coltitle=white,
  before skip=1em,
  left=5mm,  
  listing only,
  listing options={
    numbers=left,
    numberstyle=\tiny\sffamily\color{azulUFRB},
    basicstyle=\scriptsize\ttfamily,
  },
  after skip=1em
}

% notas marginais -------------------------------------------------------------
\newcounter{mynote}%~\thetcbcounter
\newtcolorbox[use counter=mynote]
  {mynote}[1][]
  {title=Saiba mais,
   width=5cm,
   left=0pt,
   right=0pt,
   fonttitle=\bfseries\color{black},
   colframe=douradoUFRB,
   colback=douradoUFRB!50,
   #1
}    

\newcommand\nota[2][]{%
  \marginnote[\footnotesize #1]{%
    \makebox[0pt][l]{\begin{mynote}%[label=#3]
    \footnotesize #2
    \end{mynote}}}%
}

% novos comandos ==============================================================
\newcommand{\lualatex}{\texttt{lualatex}}

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
                                   {\sffamily\Large\bfseries\color{azulUFRB}}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                   {-2.3ex\@plus -1ex \@minus -.5ex}%
                                   {1.2ex \@plus .3ex \@minus .3ex}%
                                   {\sffamily\large\bfseries\color{azulUFRB}}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                   {-2.3ex\@plus -1ex \@minus -.5ex}%
                                   {1ex \@plus .2ex \@minus .2ex}%
                                   {\sffamily\normalsize\bfseries\color{azulUFRB}}}
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