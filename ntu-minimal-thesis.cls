\NeedsTeXFormat{LaTeX2e}[2020-10-01]
\ProvidesClass{ntu-minimal-thesis}[2026/08/17 Minimal NTU thesis class]

\LoadClass[a4paper,12pt]{article}

% --- Engine and fonts -------------------------------------------------------
\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{ntu-minimal-thesis}
    {This class requires XeLaTeX}
    {Select XeLaTeX as the compiler and try again.}
\fi

\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\XeTeXlinebreaklocale "zh"

\newfontfamily\tnr[
  BoldFont=texgyretermes-bold.otf,
  ItalicFont=texgyretermes-italic.otf,
  BoldItalicFont=texgyretermes-bolditalic.otf
]{texgyretermes-regular.otf}

% --- Page layout ------------------------------------------------------------
\RequirePackage[top=3.5cm,bottom=3.5cm,left=3cm,right=3cm]{geometry}
\setlength{\parskip}{0ex plus0.5ex minus0.2ex}
\RequirePackage{setspace}
\doublespacing

% --- Mathematics ------------------------------------------------------------
\RequirePackage{amsmath,amsthm,accents}
\RequirePackage{unicode-math}
\DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n}
\let\mathbb\relax
\DeclareMathAlphabet{\mathbb}{U}{msb}{m}{n}
\allowdisplaybreaks

% --- Sections, figures, and tables -----------------------------------------
\RequirePackage[small]{titlesec}
\RequirePackage{graphicx}
\RequirePackage{pgf,tikz}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{caption}
\RequirePackage{subcaption}
\captionsetup{font=small}
\captionsetup[table]{belowskip=5pt}
\RequirePackage{enumitem}

% --- Links, references, and bibliography -----------------------------------
\RequirePackage{xcolor}
\definecolor{greenblue}{RGB}{35,100,170}
\definecolor{asparagus}{RGB}{107,170,117}
\definecolor{darkred}{RGB}{170,38,35}

\RequirePackage{hyperref}
\hypersetup{
  linktocpage=true,
  colorlinks=true,
  linkcolor=greenblue,
  citecolor=asparagus,
  urlcolor=greenblue
}
\RequirePackage[capitalise]{cleveref}
\RequirePackage{natbib}
\RequirePackage{apalike}

% --- Thesis metadata --------------------------------------------------------
\def\ntuminimalTitleZh{}
\def\ntuminimalTitleEn{}
\def\ntuminimalCollegeZh{}
\def\ntuminimalCollegeEn{}
\def\ntuminimalDepartmentZh{}
\def\ntuminimalDepartmentEn{}
\def\ntuminimalAuthorZh{}
\def\ntuminimalAuthorEn{}
\def\ntuminimalStudentId{}
\def\ntuminimalAdvisorZh{}
\def\ntuminimalAdvisorEn{}
\def\ntuminimalDoi{}

\def\ntuminimal@setthesisdate#1{%
  \expandafter\ntuminimal@splitthesisdate#1\@nil
}
\def\ntuminimal@splitthesisdate#1-#2\@nil{%
  \def\ntuminimalThesisYear{#1}%
  \edef\ntuminimalThesisMonth{\number\numexpr#2\relax}%
}

\def\ntuminimal@setdefensedate#1{%
  \expandafter\ntuminimal@splitdefensedate#1\@nil
}
\def\ntuminimal@splitdefensedate#1-#2-#3\@nil{%
  \def\ntuminimalDefenseYear{#1}%
  \edef\ntuminimalDefenseMonth{\number\numexpr#2\relax}%
  \edef\ntuminimalDefenseDay{\number\numexpr#3\relax}%
}

\pgfkeys{
  /ntu-minimal-thesis/.is family,
  /ntu-minimal-thesis,
  font-main/.code=\setCJKmainfont{#1},
  font-sans/.code={\setCJKsansfont{#1}\setCJKmonofont{#1}},
  font-kai/.code=\newCJKfontfamily\kai{#1},
  college-zh/.store in=\ntuminimalCollegeZh,
  college-en/.store in=\ntuminimalCollegeEn,
  department-zh/.store in=\ntuminimalDepartmentZh,
  department-en/.store in=\ntuminimalDepartmentEn,
  title-zh/.store in=\ntuminimalTitleZh,
  title-en/.store in=\ntuminimalTitleEn,
  author-zh/.store in=\ntuminimalAuthorZh,
  author-en/.store in=\ntuminimalAuthorEn,
  student-id/.store in=\ntuminimalStudentId,
  advisor-zh/.store in=\ntuminimalAdvisorZh,
  advisor-en/.store in=\ntuminimalAdvisorEn,
  thesis-date/.code=\ntuminimal@setthesisdate{#1},
  defense-date/.code=\ntuminimal@setdefensedate{#1},
  doi/.store in=\ntuminimalDoi
}
\newcommand{\ThesisSetup}[1]{%
  \pgfkeys{/ntu-minimal-thesis/.cd,#1}%
}

\def\ntuminimalThesisRocYear{%
  \number\numexpr\ntuminimalThesisYear-1911\relax
}
\def\ntuminimalDefenseRocYear{%
  \number\numexpr\ntuminimalDefenseYear-1911\relax
}
\def\ntuminimalThesisMonthName{%
  \ifcase\ntuminimalThesisMonth
    Invalid month\or January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\else
    Invalid month
  \fi
}
\newcommand{\ntuminimalIfDoiTF}[2]{%
  \ifx\ntuminimalDoi\@empty #2\else #1\fi
}

\AtBeginDocument{%
  \hypersetup{
    pdftitle={\ntuminimalTitleEn},
    pdfauthor={\ntuminimalAuthorEn}
  }
  \pagenumbering{roman}
}

% --- Fixed thesis pages -----------------------------------------------------
\newcommand{\makecover}{%
  \begin{titlepage}
    \singlespacing
    \centering
    \newgeometry{top=3cm,bottom=3cm,left=2.9cm,right=2.9cm}
    {\fontsize{18}{27}\selectfont\kai
      國立臺灣大學\ntuminimalCollegeZh\ntuminimalDepartmentZh \par
      碩士論文 \par
    }
    {\vspace{1em}
      \fontsize{14}{21}\selectfont\tnr
      \ntuminimalDepartmentEn \par
      \ntuminimalCollegeEn \par
    }
    {\fontsize{16}{24}\selectfont\tnr
      National Taiwan University \par
      Master's Thesis \par
    }
    {\vfill
      \fontsize{18}{27}\selectfont
      {\kai \ntuminimalTitleZh \par}
      \vspace{0.5em}
      {\tnr \ntuminimalTitleEn \par}
    }
    {\vfill
      \fontsize{18}{27}\selectfont
      {\kai \ntuminimalAuthorZh \par}
      {\tnr \ntuminimalAuthorEn \par}
    }
    {\vfill
      \fontsize{18}{27}\selectfont
      {\kai 指導教授：\ntuminimalAdvisorZh\;博士 \par}
      {\tnr Advisor: Dr.\ \ntuminimalAdvisorEn \par}
    }
    {\vfill
      \fontsize{18}{27}\selectfont
      {\kai\tnr 中華民國 \ntuminimalThesisRocYear 年 \ntuminimalThesisMonth 月 \par}
      {\tnr \ntuminimalThesisMonthName, \ntuminimalThesisYear \par}
    }
  \end{titlepage}
  \restoregeometry
}

\newcommand{\makeapprovalpage}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{口試委員審定書}
  \begin{singlespace}
    {\fontsize{16}{24}\selectfont
      \centering
      國立臺灣大學碩士學位論文 \par
      口試委員會審定書 \par
    }
    {\vspace{2em}
      \fontsize{14}{21}\selectfont
      \centering
      \ntuminimalTitleZh \par
      \vspace{1em}
      \ntuminimalTitleEn \par
    }
    {\vspace{2em}
      \fontsize{12}{18}\selectfont
      \noindent
      本論文係 \ntuminimalAuthorZh 君（學號 \ntuminimalStudentId）
      在國立臺灣大學\ntuminimalDepartmentZh 完成之碩士學位論文，
      於民國 \ntuminimalDefenseRocYear 年 \ntuminimalDefenseMonth 月
      \ntuminimalDefenseDay 日承下列考試委員審查通過及口試及格，特此證明。\par
    }
  \end{singlespace}
  \vspace{7em}
  \begin{doublespace}
    \centering
    \fontsize{12}{18}\selectfont
    \noindent
    \begin{tabularx}{\textwidth}{l X}
      口試委員： & \hrulefill（指導教授） \\[1em]
                 & \hrulefill \hspace{1cm} \hrulefill \\[1em]
                 & \hrulefill \hspace{1cm} \hrulefill \\[1em]
                 & \hrulefill \hspace{1cm} \hrulefill \\[1em]
                 & \hrulefill \hspace{1cm} \hrulefill \\
    \end{tabularx}
  \end{doublespace}
}

\newenvironment{acknowledgements}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{誌謝}
  \section*{\texorpdfstring{\centerline{\mdseries 誌謝}}{誌謝}}
}{}

\newenvironment{abstracten}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{英文摘要}
  \section*{\texorpdfstring{\centerline{Abstract}}{Abstract}}
  \def\ntuminimalKeywordLabel{Keywords}
}{}

\newenvironment{abstractzh}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{中文摘要}
  \section*{\texorpdfstring{\centerline{\mdseries 中文摘要}}{中文摘要}}
  \def\ntuminimalKeywordLabel{關鍵字}
}{}

\newcommand{\keywords}[1]{%
  \begin{description}
    \item[\ntuminimalKeywordLabel] #1
  \end{description}
}

\newcommand{\makethesistableofcontents}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{Table of Contents}
  \tableofcontents
}

\newcommand{\thesismainmatter}{%
  \clearpage
  \pagenumbering{arabic}
}

\newcommand{\printthesisbibliography}{%
  \phantomsection
  \addcontentsline{toc}{section}{References}
  \bibliographystyle{apalike}
  \bibliography{references}
}

% --- Watermark and DOI ------------------------------------------------------
\AddToHook{shipout/background}{%
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north east,opacity=1,inner sep=0pt]
      at ([xshift=-2.5cm,yshift=-2.5cm]current page.north east)
      {\includegraphics[scale=0.5]{assets/watermark_faint.pdf}};
    \ntuminimalIfDoiTF{%
      \node[anchor=south east,inner sep=0pt,
        font=\fontsize{12}{14}\selectfont]
        at ([xshift=-1cm,yshift=1cm]current page.south east)
        {\texttt{doi:\ntuminimalDoi}};
    }{}
  \end{tikzpicture}%
}
