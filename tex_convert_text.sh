#!/bin/sh

gawk '/BEGIN LYX TEXT/ { on=1 } { if (on) print } /END LYX TEXT/ { on=0 }' "$1" |\
sed 's,\\subsection{,\\subsubsection{,g' |\
sed 's,\\section{,\\subsection{,g;
     s,\\~,\\textasciitilde{},g;
     s,—,\\textemdash{},g;'
