#!/bin/sh

gawk '/BEGIN LYX '$1'/ { on=1 } { if (on) print } /END LYX '$1'/ { on=0 }' "$2" |\
sed 's,\\subsection{,\\subsubsection{,g' |\
sed 's,\\section{,\\subsection{,g;
     s,\\~,\\textasciitilde{},g;
     s,—,\\textemdash{},g;'

