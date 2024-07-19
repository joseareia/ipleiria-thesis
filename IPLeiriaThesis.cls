% Author Name: José António Portela Areia 
% Author Contact: jose.apareia@gmail.com
% Version: 1.1.0 - 2024/02/13
% Public Repository: https://github.com/joseareia/ipleiria-thesis

% Class information
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IPLeiriaThesis}[2023/12/12 IPLeiria Thesis Class]

% Process class options: document language
\DeclareOption{en}{\def\IPLeiria@language{english}}
\DeclareOption{pt}{\def\IPLeiria@language{portuguese}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

% Load master class
\LoadClass[a4paper,twoside,11pt]{report}

% Load the babel package with language settings
\RequirePackage[main=english,portuguese]{babel}

% Define a command to get the selected language
\newcommand{\getLanguage}{\IPLeiria@language}
\ifx\IPLeiria@language\@undefined\renewcommand{\getLanguage}{english}\fi

% Select the language specified by the user
\AtBeginDocument{%
    \ifx\IPLeiria@language\@undefined
        \PackageWarning{IPLeiriaThesis}{Language not specified. Defaulting to English.}%
        \selectlanguage{english}%
    \else
        \selectlanguage{\IPLeiria@language}%
    \fi
}

% Required packages
\usepackage{graphicx} % Required for including images
\usepackage{amsmath} % Mathematical expressions
\usepackage{amssymb} % Mathematical symbols
\usepackage[dvipsnames]{xcolor} % Using colors within the document
\usepackage{tocbibind} % Add list of figures and tables of contents
\usepackage[toc,page]{appendix} % Add Appendix
\usepackage{titling} % Titlepage and titleback customisation
\usepackage[calc]{datetime2} % Current date with both 
\usepackage{tcolorbox} % Highlighted box
\usepackage{subcaption} % For side-by-side figures
\usepackage{xparse} % "Davide" problem... solved!
\usepackage{ifthen} % Conditional statements
\usepackage{blindtext} % Generate dummy text
\usepackage{silence} % No warnings in certain packages
\usepackage{typearea} % KOMA options for page rotation
\usepackage{tikz}

% Silence some warnings
\WarningsOff[blindtext] % No support for portuguese language

% Colors
\colorlet{redreport}{red!50!black}

% Margins
\usepackage[
	top=2.5cm, % Top margin
	bottom=2.5cm, % Bottom margin
	left=3.2cm, % Left margin
	right=3.2cm, % Right margin
	footskip=1.6cm, % Space from the bottom margin to footer
	headsep=0.75cm, % Space from the top margin to header
	%showframe % Uncomment to show frames around the margins for debugging
]{geometry}

% Fonts
\usepackage[utf8]{inputenc} % Required for international characters
\usepackage[T1]{fontenc} % Font encoding for international characters
\usepackage{newpxtext} % Alternative use of the PX fonts
\usepackage{newpxmath} % Alternative use of the PX fonts (Math)
\usepackage{microtype} % Slightly tweak font spacing for aesthetics
\usepackage{fvextra} % Compatibility with csquotes (?)
\usepackage{csquotes} % Compatibility with babel (?)
\linespread{1.2} % Increase line spacing slightly

% Glossary & Acronyms
\usepackage[toc,acronym]{glossaries} 
% https://www.dickimaw-books.com/gallery/glossaries-styles/#tree-style
% https://tex.stackexchange.com/questions/346681/space-between-acronym-entry-and-it-description
\setglossarystyle{long} % Glossary style
\setlength\LTleft{-6pt} % Left margin
\setlength\LTright{0pt} % Right margin
\setlength\glsdescwidth{0.94\hsize} % Glossary description width
\renewcommand{\glsnamefont}[1]{\textbf{#1}} % Notation in bold
\renewcommand{\glossaryentrynumbers}[1]{\textit{(p. \textcolor{redreport}{#1})}} % Page number customisation

% Adjust the height of the text area
\addtolength{\textheight}{-20pt}
\setlength{\headheight}{20pt}

% Header & Footer
\usepackage{fancyhdr} % Required for customizing headers and footers
\usepackage[bottom, hang]{footmisc} % Force footnotes to the bottom
\pagestyle{fancy} \fancyhf{} % Clear default style
\renewcommand{\headrulewidth}{.3pt}
\setlength{\footnotemargin}{6pt} % Footnote space

\renewcommand{\chaptermark}[1]{\markboth{\textit{\thechapter. #1}}{}}
\renewcommand{\sectionmark}[1]{\markright{\textit{\thesection. #1}}}

\fancyhead[OLH]{
    \ifnum\value{section}=0\leftmark
    \else\rightmark
    \fi
\vspace{3pt}} % Section name... if not empty!
\fancyhead[ERH]{\leftmark\vspace{3pt}} % Chapter name
\fancyhead[ORH,ELH]{\thepage\vspace{3pt}} % Page numbering

% Place the page numbering on bottom when the page style is empty, i.e., when a new chapter starts
\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyfoot[ORF,ELF]{\thepage\vspace{3pt}}%
}

% Bibliography
\usepackage[
	backend=biber, % Use the biber backend for compiling the bibliography
	citestyle=authoryear, % In-text citation style
	bibstyle=authoryear, % Bibliography style
	sorting=nyt, % Order references
    natbib=true, % Use natbib compatibility mode
    uniquelist=false % Only show one author, e.g. (Author et al., 2023)
]{biblatex}

\setlength\bibitemsep{1.5\itemsep} % Adjust the space between references
\setlength\bibhang{0pt} % Remove indentation
\renewcommand*{\bibfont}{\small} % Change references font size
\addbibresource{Bibliography/Bibliography.bib} % Reference document

% Highlight both Author and Year in the citations
\ExecuteBibliographyOptions{maxcitenames=1}
\DeclareFieldFormat{citehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{#1}}
\DeclareFieldFormat{textcitehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{%
    #1%
    \ifbool{cbx:parens}
      {\bibcloseparen\global\boolfalse{cbx:parens}}
      {}}}
\savebibmacro{cite}
\savebibmacro{textcite}
\renewbibmacro*{cite}{%
  \printtext[citehyperref]{%
    \restorebibmacro{cite}%
    \usebibmacro{cite}}}
\renewbibmacro*{textcite}{%
  \ifboolexpr{
    ( not test {\iffieldundef{prenote}} and
      test {\ifnumequal{\value{citecount}}{1}} )
    or
    ( not test {\iffieldundef{postnote}} and
      test {\ifnumequal{\value{citecount}}{\value{citetotal}}} )
  }
    {\DeclareFieldAlias{textcitehyperref}{noformat}}
    {}%
  \printtext[textcitehyperref]{%
    \restorebibmacro{textcite}%
    \usebibmacro{textcite}}}
    
% Tables
\usepackage{tabularx} % Table length
\usepackage{booktabs} % Table style
\usepackage{multirow} % Multirow
\usepackage{longtable} % For long tables
\newcommand{\customtableformatting}{
    \renewcommand{\arraystretch}{1.1}\small
} % Increase space between rows and smaller font
\AtBeginEnvironment{tabular}{\customtableformatting} % Apply to tabular
\AtBeginEnvironment{tabularx}{\customtableformatting} % Apply to tabularx
\preto\longtable{\customtableformatting} % Apply to longtable

% Captions
\usepackage{caption} % Required for customizing captions
\captionsetup{skip=6pt} % Whitespace between figures/tables and the caption
\captionsetup{
    labelfont={bf,small},
    textfont={it,small}
} % Caption font style
\captionsetup[table]{skip=3pt} % Align left

% Lists
\usepackage{enumitem} % Required for list customization
\setlist{noitemsep} % Customize spacing around and inside lists

% Links
\usepackage[bookmarks]{hyperref} % Required for links

% Capitalise the first letter when \autoref for both English and Portuguese
\addto\extrasenglish{\def\figureautorefname{Figure}}
\addto\extrasenglish{\def\chapterautorefname{Chapter}}
\addto\extrasenglish{\def\sectionautorefname{Section}}
\addto\extrasenglish{\def\subsectionautorefname{Section}}
\addto\extrasenglish{\def\subsubsectionautorefname{Section}}
\addto\extrasenglish{\def\tableautorefname{Table}}
\addto\extrasenglish{\def\partautorefname{Part}}
\addto\extrasenglish{\def\appendixautorefname{Appendix}}
\addto\extrasportuguese{\def\sectionautorefname{Secção}}
\addto\extrasportuguese{\def\subsectionautorefname{Secção}}
\addto\extrasportuguese{\def\subsubsectionautorefname{Secção}}

% Custom color for citations and references
\hypersetup{
	colorlinks=true, % Whether to color the text of links
	urlcolor=black, % Color for \url and \href links
	linkcolor=redreport, % Color for \nameref links
	citecolor=redreport, % Color of reference citations
}

% Titlepage and titleback variables
\NewDocumentCommand{\firstauthor}{m}{\newcommand{\firstauthorname}{#1}}
\NewDocumentCommand{\secondauthor}{m}{\newcommand{\secondauthorname}{#1}}
\NewDocumentCommand{\thirdauthor}{m}{\newcommand{\thirdauthorname}{#1}}
\NewDocumentCommand{\firstauthorid}{m}{\newcommand{\firstauthornum}{#1}}
\NewDocumentCommand{\secondauthorid}{m}{\newcommand{\secondauthornum}{#1}}
\NewDocumentCommand{\thirdauthorid}{m}{\newcommand{\thirdauthornum}{#1}}
\NewDocumentCommand{\supervisor}{m}{\newcommand{\supname}{#1}}
\NewDocumentCommand{\secondsupervisor}{m}{\newcommand{\secondsupname}{#1}}
\NewDocumentCommand{\thirdsupervisor}{m}{\newcommand{\thirdsupname}{#1}}
\NewDocumentCommand{\supervisormail}{m}{\newcommand{\supmail}{#1}}
\NewDocumentCommand{\secondsupervisormail}{m}{\newcommand{\secondsupmail}{#1}}
\NewDocumentCommand{\thirdsupervisormail}{m}{\newcommand{\thirdsupmail}{#1}}
\NewDocumentCommand{\subtitle}{m}{\newcommand{\subname}{#1}}
\NewDocumentCommand{\university}{m}{\newcommand{\univname}{#1}}
\NewDocumentCommand{\school}{m}{\newcommand{\schoolname}{#1}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degname}{#1}}
\NewDocumentCommand{\course}{m}{\newcommand{\coursename}{#1}}

% Chapters & Sections
\usepackage{titlesec}
\titleformat{\chapter}[display]
{\flushright\normalsize\huge\color{black}}%
{\flushright\normalsize%
{\fontsize{25}{25}\selectfont\hspace*{-1em}\rule[-2pt]{.1pt}{30pt}\hspace{0.5em}\raisebox{4.5pt}{\thechapter}}}%
{10pt}%
{\huge\scshape\textls[50]}%

% Abstract Keywords
\NewDocumentCommand{\keywordsen}{m}{
    \vspace{.4cm}\noindent\textbf{Keywords:} #1
}
\NewDocumentCommand{\keywordspt}{m}{
    \vspace{.4cm}\noindent\textbf{Palavras-Chave:} #1
}

% Blankpage with warning for left blank
\newcommand\blankpage{
    \clearpage
    \thispagestyle{empty}%
    \addtocounter{page}{1}%
    \vspace*{\fill}
    \begin{center}
        \ifthenelse{\equal{\getLanguage}{portuguese}}{%
            \textcolor{gray!50}{\textit{Página intencionalmente deixada em branco.}}
        }{%
            \textcolor{gray!50}{\textit{This page intentionally left blank.}}
        }
    \end{center}
    \vspace*{\fill}
    \clearpage
}   

% Todo notes
\newcommand{\todo}[1]{\textcolor{red}{TODO: #1.}}

% Define a custom environment for the highlighted box
\newenvironment{importantbox}{%
  \begin{tcolorbox}[colback=gray!20, colframe=gray!50, arc=5pt, boxrule=1pt, left=15pt, right=15pt, top=10pt, bottom=10pt]%
  \small
}{%
  \end{tcolorbox}%
}

% Code highlighting and printing
\usepackage[newfloat]{minted}
\newenvironment{code}{\captionsetup{type=listing}}{}
\ifthenelse{\equal{\getLanguage}{portuguese}}{%
    \SetupFloatingEnvironment{listing}{name=Listagem}
}{%
    \SetupFloatingEnvironment{listing}{name=Listing}
}
\captionsetup[listing]{skip=-7pt}

\newenvironment{longlisting}{\captionsetup{type=listing}}

% Define a new minted style
\setminted{
    frame=lines,
    framesep=2mm,
    baselinestretch=1.2,
    fontsize=\footnotesize,
    linenos,
    tabsize=4,
    breaklines=true,
    breakanywhere=true
}

% Create a plainpage followed by a blankpage
\newcommand{\plainblankpage}{\thispagestyle{plain}\blankpage}

% Landscape mode done correctly
% https://tex.stackexchange.com/questions/9071/how-to-translate-and-rotate-the-heading-of-landscaped-pages
\makeatletter
\def\ifGm@preamble#1{\@firstofone}
\appto\restoregeometry{%
    \pdfpagewidth=\paperwidth
    \pdfpageheight=\paperheight}
\apptocmd\newgeometry{%
    \pdfpagewidth=\paperwidth
    \pdfpageheight=\paperheight}{}{}
\makeatother

\newenvironment{landscapemode}[2]{%
    \newgeometry{paperwidth=#1,paperheight=#2,hmargin=3cm,vmargin=5cm,top=3cm,landscape}
    \fancyheadoffset{0pt}
    %\titlespacing*{\chapter}{0pt}{0pt}{40pt}
}{%
    \restoregeometry
    \fancyheadoffset{0pt}
}

% Command to display "Student No." in the languages supported
\newcommand{\studentnumberprefix}{%
    \ifthenelse{\equal{\getLanguage}{portuguese}}{%
        Estudante N.º%
    }{%
        Student No.%
    }
}