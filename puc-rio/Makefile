
INTERPRETERS = LvInterpreter_demo.tex LvInterpreter_preamble.tex LvInterpreter_text.tex PdInterpreter_demo.tex PdInterpreter_preamble.tex PdInterpreter_text.tex XlInterpreter_demo.tex XlInterpreter_preamble.tex XlInterpreter_text.tex

EPS = bras_horiz_pb.pdf excel_evaluation.pdf subgraph_1.pdf subgraph_anim_0.pdf subgraph_anim_1.pdf subgraph_anim_2.pdf subgraph_separate_runtime.pdf subgraph_single_runtime.pdf subgraph_w_separate_graph_runtime.pdf subgraph_w_separate_graphs.pdf subgraph_w_single_graph.pdf subgraph_w_single_graph_runtime.pdf subgraph_w_single_graph_separate_runtime.pdf

CHAPTERS = chapter-1.tex chapter-2.tex chapter-3.tex chapter-4.tex chapter-5.tex chapter-6.tex chapter-7.tex chapter-8.tex chapter-9.tex appendix.tex abstract.tex resumo.tex
TEX_FILES = abstract.tex ack.tex conclusions.tex resumo.tex thesis.tex appendix.tex
BIB_FILES = thesis.bib 
THESISPUC_FILES = atbeginend.sty puc.png ThesisPUC.bst ThesisPUC.cls 

thesis.pdf: $(TEX_FILES) $(CHAPTERS) $(INTERPRETERS) $(BIB_FILES) $(THESISPUC_FILES) $(EPS)
	pdflatex thesis.tex || true
	cat thesis.aux | grep -v 'newlabel{[^}]*[\t]tt[^}]*}' > thesis.aux.new
	mv thesis.aux.new thesis.aux
	pdflatex thesis.tex
	bibtex thesis
	pdflatex thesis.tex
	pdflatex thesis.tex
	pdflatex thesis.tex

%.pdf: %.eps
	epstopdf $<

../thesis.tex: ../thesis.lyx
	lyx ../thesis.lyx -E pdflatex $@

chapter-1.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex 1 > $@

chapter-2.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex 2 > $@

chapter-3.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex 3 > $@

chapter-4.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex 4 > $@

chapter-5.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex 5 > $@

chapter-6.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex 6 > $@

chapter-7.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex 7 > $@

chapter-8.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex 8 > $@

chapter-9.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex 9 > $@

appendix.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex appendix > $@

abstract.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex abstract > $@

resumo.tex: ../thesis.tex get_chapter
	./get_chapter ../thesis.tex resumo > $@

touch:
	rm -f thesis.pdf

clean:
	rm -f thesis.pdf *.bbl *.aux *.blg *.lof *.log *.lot *.out *.toc

realclean: clean
	rm -f $(CHAPTERS)
