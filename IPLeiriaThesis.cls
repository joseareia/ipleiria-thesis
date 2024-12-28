% Author Name: José António Portela Areia 
% Author Contact: jose.apareia@gmail.com
% Version: 2.3.0 - 2024/11/28
% Public Repository: https://github.com/joseareia/ipleiria-thesis

%%% Class Information %%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IPLeiriaThesis}[2023/12/12 IPLeiria Thesis Class]

\RequirePackage{expl3} % Required for writing LaTeX3 code in this class.

%%% Handle Class Options %%%
\ExplSyntaxOn
\keys_define:nn { IPLeiriaThesis } {
    school .choices:nn =
        { estg, esecs, esslei, esad, estm }
        { \tl_gset:Nn \g_IPLeiriaThesis_myschool_tl { #1 } },
    school / unknown .code:n = 
        { \ClassWarningNoLine{IPLeiriaThesis}
        {Specified~'school'~not~available.~Defaulting~to~'estg'} },
    school .default:n = { estg },
    school .initial:n = { estg },

    cover .choices:nn =
        { classic, bw }
        { \tl_gset:Nn \g_IPLeiriaThesis_mycover_tl { #1 } },
    cover / unknown .code:n = 
        { \ClassWarningNoLine{IPLeiriaThesis}{Specified~'cover'~not~available.~Defaulting~to~'classic'} },
    cover .default:n = { classic },
    cover .initial:n = { classic },

    language .choices:nn = 
        { english, portuguese } 
        { \tl_gset:Nn \g_IPLeiriaThesis_mylanguage_tl { #1 } },
    language / unknown .code:n = 
        { \ClassWarningNoLine{IPLeiriaThesis}{Specified~'language'~not~available.~Defaulting~to~'english'} },
    language .default:n = { english },
    language .initial:n = { english },

    style .choices:nn = 
        { classic, fancy, modern } 
        { \tl_gset:Nn \g_IPLeiriaThesis_style_tl { #1 } },
    style / unknown .code:n = 
        { \ClassWarningNoLine{IPLeiriaThesis}{Specified~'style'~not~available.~Defaulting~to~'classic'} },
    style .default:n = { classic },
    style .initial:n = { classic },

    unknown .code:n = 
        { \ClassWarningNoLine{IPLeiriaThesis}{An~unknown~option~was~ignored.~Please~check~the~documentation~to~see~the~available~options} }
}

\newcommand{\LanguageOption}{\g_IPLeiriaThesis_mylanguage_tl}
\newcommand{\SchoolOption}{\g_IPLeiriaThesis_myschool_tl}
\newcommand{\CoverOption}{\g_IPLeiriaThesis_mycover_tl}
\newcommand{\ChapterOption}{\g_IPLeiriaThesis_style_tl}

\AtBeginDocument
{
    \iow_log:e { School:~\g_IPLeiriaThesis_myschool_tl }
    \iow_log:e { Cover:~\g_IPLeiriaThesis_mycover_tl }
    \iow_log:e { Language:~\g_IPLeiriaThesis_mylanguage_tl }
    \iow_log:e { Style:~\g_IPLeiriaThesis_style_tl }
}

\ProcessKeyOptions[IPLeiriaThesis]
\ExplSyntaxOff

%%% Load Master Class %%%
\LoadClass[a4paper,twoside,11pt]{report}

%%% Load Babel Package (Language) %%%
\RequirePackage[main=english,portuguese]{babel}
\expandafter\selectlanguage\expandafter{\LanguageOption}

%%% Required Packages %%%
\RequirePackage{ifthen} % Provides conditional statements.
\RequirePackage{etoolbox} % Advanced programming tools for LaTeX.
\RequirePackage{graphicx} % For including and manipulating images.
\RequirePackage{subcaption} % Subfigures and side-by-side captions.
\RequirePackage{tabularx} % Flexible-width tables.
\RequirePackage{booktabs} % Professional table styling.
\RequirePackage{multirow} % Support for multirow cells in tables.
\RequirePackage{longtable} % Tables spanning multiple pages.
\RequirePackage{caption} % Customisation of captions.
\RequirePackage{enumitem} % Customisation of lists.
\RequirePackage{amsmath} % Advanced mathematical expressions.
\RequirePackage{amssymb} % Extended mathematical symbols.
\RequirePackage[dvipsnames]{xcolor} % Extended color support.
\RequirePackage{tcolorbox} % Creating colored and highlighted boxes.
\RequirePackage{varwidth} % Allows variable-width boxes.
\RequirePackage{titlesec} % Customisation of section and chapter titles.
\RequirePackage{titling} % Control over title and titlepage formatting.
\RequirePackage[toc,page]{appendix} % Formatting for appendices.
\RequirePackage[acronym]{glossaries} % Create glossaries and acronyms.
\RequirePackage[calc]{datetime2} % Enhanced date and time formatting.
\RequirePackage[bookmarks,pdfusetitle]{hyperref} % Hyperlinks and PDF metadata.
\RequirePackage{xparse} % Advanced argument parsing for custom macros.
\RequirePackage{typearea} % Page layout adjustments (KOMA-Script).
\RequirePackage{eso-pic} % Adding elements to the page background.
\RequirePackage{setspace} % Adjust line spacing.
\RequirePackage[newfloat]{minted} % Syntax highlighting for code.
\RequirePackage{silence} % Suppress specific package warnings.
\RequirePackage{fontawesome5} % Font awesome icons.
\RequirePackage{contour} % Countour words in a given color.
\RequirePackage{ulem} % A better underline.
\RequirePackage{blindtext} % Generate placeholder text.

\tcbuselibrary{most} % Load most libraries from the tcolorbox package.
\WarningsOff[blindtext] % Suppress warnings from the blindtext package.

%%% Import Configurations - Maintain the Specified Order! %%%
\usepackage{Configurations/00-Fonts}
\usepackage{Configurations/01-Layout}
\usepackage{Configurations/02-References}
\usepackage{Configurations/03-Formatting}
\usepackage{Configurations/04-Structure}
\usepackage{Configurations/05-Terms}
\usepackage{Configurations/06-Chapters}
\usepackage{Configurations/07-Elements}
\usepackage{Configurations/08-Code}
\usepackage{Configurations/09-Macros}
\usepackage{Configurations/10-Extras}
\usepackage{Configurations/11-Settings}