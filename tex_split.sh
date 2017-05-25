#!/bin/sh

gawk '/BEGIN LYX '$1'/ { on=1 } { if (on) print } /END LYX '$1'/ { on=0 }' "$2" |\
sed 's,\\subsection{,\\subsubsection{,g' | {
   if [[ "$1" != "DEMO" ]]
   then
      sed 's,\\section{,\\subsection{,g;'
   else
      cat
   fi
} |\
   sed 's,\\~,\\textasciitilde{},g;
        s,—,\\textemdash{},g;'
