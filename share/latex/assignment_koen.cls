% ---------------------------------------------------
%    Assignment template for LaTeX (using XeLaTex)
%          Written by Koen van Greevenbroek
% ---------------------------------------------------


% HOW TO USE THIS DOCUMENT CLASS:
%  1. Make sure you pick a font that is installed on your system, see
%     the 'Font setup' section below.
%  2. Place this file ('assignment.cls') in the same directory as your
%     master .tex file (or install this file to your /textmf directory).
%  3. Start the .tex file with \documentclass{assignment}.
%  4. Call '\name', '\studentnum', '\subject' and '\title' in the
%     preamble of the .tex file, e.g. '\name{Koen}'
%  5. Call '\updateheader' in the preamble of the .tex file, with
%     no argument. This sets up the header with the info you gave it.
%  6. Compile the .tex file with 'xelatex', e.g. 'xelatex main.tex'.
%     If you are using a LaTeX IDE, configure it to use XeLaTeX.
%  7. Done!


% Based on the 'article' document class
\LoadClass[11pt]{article}

% Provides the 'assignment' document class
\ProvidesClass{assignment}


% Fields to set by user
\makeatletter
	\newcommand{\name}[1]{\def \@name {#1}}               % name
	\newcommand{\subject}[1]{\def \@subject {#1}}         % subject
    \newcommand{\studentnum}[1]{\def \@studentnum {#1}}   % student number
	\name{}
	\subject{}
    \studentnum{}
\makeatother


% Math packages                            provides:
\RequirePackage{amsthm}                  % 'proof' environment
\RequirePackage{amsmath}                 % 'align', 'split', other environments
\RequirePackage[libertine]{newtxmath}    % math font, works well with Linux Libertine
\RequirePackage{mathtools}               % various math tools
\RequirePackage{amsfonts}                % more math fonts
\RequirePackage{amssymb}                 % more math symbols

% Font / XeLaTeX setup
\RequirePackage{xunicode}                % use unicode encoding for source file
\RequirePackage[no-math]{fontspec}       % fontspec for easily selecting fonts
\RequirePackage{xltxtra}                 % auxiliary package for XeLaTeX
\defaultfontfeatures{Ligatures=TeX}      % turn default ligatures on

% Font setup - can replace by any font installed on system, e.g. 'Times New Roman'
% Main font: Linux Libertine O
\setromanfont[Mapping=tex-text]{Linux Libertine O}
% Monospace font: Inconsolata
\setmonofont[Mapping=tex-text]{Inconsolata}

% Customize font for section titles
\newfontfamily\secfont{Linux Biolinum O}
\RequirePackage{titlesec}
\newcommand{\secstyle}{\secfont\LARGE\bfseries}
\titleformat{\section}
  {\secstyle}      % format
  {\thesection}    % label
  {10pt}           % sep
  {}               % before
  [\normalfont]    % after

% Page
\RequirePackage[margin=3cm]{geometry}    % set margins to 3cm
\setlength\parindent{0pt}                % don't indent first line of paragraphs
\setlength\parskip{1ex}                  % set spacing between paragraphs to 1ex
\linespread{1.2}                         % set line spacing to 1.2 spacing
\allowdisplaybreaks                      % allow 'aling' to span over page breaks

% Miscellaneous
\RequirePackage[english]{babel}          % english language support
\RequirePackage[shortlabels]{enumitem}   % better 'enumerate', e.g. \begin{enumerate}[(a)] ...
\RequirePackage{braket}                  % provides \set{} command, and more
\RequirePackage{graphicx}                % more options for including graphics

% Header setup
\RequirePackage{lastpage}                % allow reference to total number of pages
\RequirePackage{fancyhdr}                % provide the nicer header
\pagestyle{fancy}                        % use the nicer header for all pages

% Function to create the header
% Call '\updateheader' in preable of .tex document, after setting user fields
% Will appear as follows: "<subject> -- <title>    <name> #<stu.num.>    <date>"
\makeatletter
	\newcommand{\updateheader}{
		\fancyhead[L]{\@subject\ --- \@title}
		\fancyhead[C]{\@name\ (\#\@studentnum)}
		\fancyhead[R]{\today}
		\fancyfoot[C]{\thepage\ of \pageref{LastPage}}
		\setlength{\headheight}{25pt}
	}
\makeatother
