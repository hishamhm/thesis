
.PHONY: all pull

GENERATED_TEX=\
	XlInterpreter_text.tex XlInterpreter_preamble.tex \
	PdInterpreter_text.tex PdInterpreter_preamble.tex \
	LvInterpreter_text.tex LvInterpreter_preamble.tex 

all: $(GENERATED_TEX)

# spreadsheet

XlInterpreter_text.tex: spreadsheet/XlInterpreter.tex
	./tex_convert_text.sh spreadsheet/XlInterpreter.tex > XlInterpreter_text.tex

XlInterpreter_preamble.tex: spreadsheet/XlInterpreter.tex
	./tex_convert_preamble.sh spreadsheet/XlInterpreter.tex > XlInterpreter_preamble.tex

spreadsheet/XlInterpreter.tex: spreadsheet/XlInterpreter.lhs
	cd spreadsheet && make XlInterpreter.tex

# puredata

PdInterpreter_text.tex: puredata/PdInterpreter.tex
	./tex_convert_text.sh puredata/PdInterpreter.tex > PdInterpreter_text.tex

PdInterpreter_preamble.tex: puredata/PdInterpreter.tex
	./tex_convert_preamble.sh puredata/PdInterpreter.tex > PdInterpreter_preamble.tex

puredata/PdInterpreter.tex: puredata/PdInterpreter.lhs
	cd puredata && make PdInterpreter.tex

# lv

LvInterpreter_text.tex: lv/LvInterpreter.tex
	./tex_convert_text.sh lv/LvInterpreter.tex > LvInterpreter_text.tex

LvInterpreter_preamble.tex: lv/LvInterpreter.tex
	./tex_convert_preamble.sh lv/LvInterpreter.tex > LvInterpreter_preamble.tex

lv/LvInterpreter.tex: lv/LvInterpreter.lhs
	cd lv && make LvInterpreter.tex

#

excel_evaluation_gen.eps: excel_evaluation_gen.dot
	dot -Teps -o excel_evaluation_gen.eps excel_evaluation_gen.dot

pull:
	git pull --recurse-submodules

clean:
	rm -f $(GENERATED_TEX)
