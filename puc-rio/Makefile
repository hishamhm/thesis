
INTERPRETERS = LvInterpreter_demo.tex LvInterpreter_preamble.tex LvInterpreter_text.tex PdInterpreter_demo.tex PdInterpreter_preamble.tex PdInterpreter_text.tex XlInterpreter_demo.tex XlInterpreter_preamble.tex XlInterpreter.tex XlInterpreter_text.tex

CHAPTERS = chapter-1.tex chapter-2.tex chapter-3.tex chapter-4.tex chapter-5.tex chapter-6.tex chapter-7.tex chapter-8.tex chapter-9.tex
TEX_FILES = abstract.tex ack.tex conclusions.tex resumo.tex thesis.tex appendix.tex
BIB_FILES = thesis.bib 
THESISPUC_FILES = atbeginend.sty puc.png ThesisPUC.bst ThesisPUC.cls 

thesis.pdf: $(TEX_FILES) $(CHAPTERS) $(INTERPRETERS) $(BIB_FILES) $(THESISPUC_FILES)
	pdflatex thesis.tex
	pdflatex thesis.tex
	bibtex thesis
	bibtex thesis
	bibtex thesis
	pdflatex thesis.tex

../thesis.tex: ../thesis.lyx
	lyx ../thesis.lyx -E pdflatex ../thesis.tex

chapter-1.tex: ../thesis.tex
	./get_chapter ../thesis.tex 1 > chapter-1.tex

chapter-2.tex: ../thesis.tex
	./get_chapter ../thesis.tex 2 > chapter-2.tex

chapter-3.tex: ../thesis.tex
	./get_chapter ../thesis.tex 3 > chapter-3.tex

chapter-4.tex: ../thesis.tex
	./get_chapter ../thesis.tex 4 > chapter-4.tex

chapter-5.tex: ../thesis.tex
	./get_chapter ../thesis.tex 5 > chapter-5.tex

chapter-6.tex: ../thesis.tex
	./get_chapter ../thesis.tex 6 > chapter-6.tex

chapter-7.tex: ../thesis.tex
	./get_chapter ../thesis.tex 7 > chapter-7.tex

chapter-8.tex: ../thesis.tex
	./get_chapter ../thesis.tex 8 > chapter-8.tex

chapter-9.tex: ../thesis.tex
	./get_chapter ../thesis.tex 9 > chapter-9.tex

touch:
	rm -f thesis.pdf

clean:
	rm -f thesis.pdf *.bbl *.aux *.blg *.lof *.log *.lot *.out *.toc

realclean: clean
	rm -f $(CHAPTERS)
