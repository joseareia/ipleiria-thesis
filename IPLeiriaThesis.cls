% Author Name: José António Portela Areia 
% Author Contact: jose.apareia@gmail.com
% Version: 2.2.0 - 2024/11/14
% Public Repository: https://github.com/joseareia/ipleiria-thesis

%%% Class Information %%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IPLeiriaThesis}[2023/12/12 IPLeiria Thesis Class]

%%% Document Language %%%
\DeclareOption{en}{\def\IPLeiria@language{english}}
\DeclareOption{pt}{\def\IPLeiria@language{portuguese}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

%%% B&W Cover Option %%%
\newif\ifbwcover\DeclareOption{bwcover}{\bwcovertrue}

%%% School Logotype Options %%%
\newif\ifestg\DeclareOption{estg}{\estgtrue}
\newif\ifesad\DeclareOption{esad}{\esadtrue}
\newif\ifesecs\DeclareOption{esecs}{\esecstrue}
\newif\ifesslei\DeclareOption{esslei}{\essleitrue}
\newif\ifestm\DeclareOption{estm}{\estmtrue}

\ProcessOptions\relax

%%% Load Master Class %%%
\LoadClass[a4paper,twoside,11pt]{report}

%%% Load Babel Package (Language) %%%
\RequirePackage[main=english,portuguese]{babel}
\newcommand{\getLanguage}{\IPLeiria@language}
\ifx\IPLeiria@language\@undefined\renewcommand{\getLanguage}{english}\fi

\AtBeginDocument{%
    \ifx\IPLeiria@language\@undefined
        \PackageWarning{IPLeiriaThesis}{Language not specified. Defaulting to English.}%
        \selectlanguage{english}%
    \else
        \selectlanguage{\IPLeiria@language}%
    \fi
}

\AtBeginDocument{%
    \ifx\ifestgtrue\undefined
        \ifx\ifesadtrue\undefined
            \ifx\ifesecstrue\undefined
                \ifx\ifessleitrue\undefined
                    \ifx\ifestmtrue\undefined
                        \estgtrue
                        \PackageWarning{IPLeiriaThesis}{No specific school option passed. Defaulting to ESTG.}%
                    \fi
                \fi
            \fi
        \fi
    \fi
}

%%% Required Packages (With Additional Information) %%%
\usepackage{graphicx} % Required for including images.
\usepackage{amsmath} % Mathematical expressions.
\usepackage{amssymb} % Mathematical symbols.
\usepackage[dvipsnames]{xcolor} % Using colors within the document.
\usepackage[toc,page]{appendix} % Add appendix.
\usepackage{titling} % Titlepage and titleback customisation.
\usepackage[calc]{datetime2} % Current date with both.
\usepackage{tcolorbox} % Highlighted box.
\usepackage{subcaption} % For side-by-side figures.
\usepackage{xparse} % "Davide" problem... solved!
\usepackage{ifthen} % Conditional statements.
\usepackage{silence} % No warnings in certain packages.
\usepackage{typearea} % KOMA options for page rotation.
\usepackage{eso-pic} % For the background in both front and back matter.
\usepackage{setspace} % For line height adjusts.
\usepackage{varwidth} % Dependency for the custom boxes.
\usepackage{etoolbox} % Toolbox of programming tools for LaTeX classes.
\usepackage{blindtext} % Generate dummy text.

\tcbuselibrary{most} % Load more libaries from tcolorbox package.
\WarningsOff[blindtext] % No support for portuguese language. Silence: On.

%%% Import of Configurations -- Do Not Change the Order! %%%
\input{Configurations/00-Fonts}
\input{Configurations/01-Margins}
\input{Configurations/02-Bibliography}
\input{Configurations/03-Header-Footer}
\input{Configurations/04-ToC}
\input{Configurations/05-Glossary}
\input{Configurations/06-Chapters}
\input{Configurations/07-Tables-Captions}
\input{Configurations/08-Code}
\input{Configurations/09-Custom-Commands}
\input{Configurations/10-Miscellaneous}
\input{Configurations/11-Variables}