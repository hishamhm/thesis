
.PHONY: all pull

GENERATED_TEX=\
	XlInterpreter_text.tex XlInterpreter_preamble.tex XlInterpreter_demo.tex \
	PdInterpreter_text.tex PdInterpreter_preamble.tex PdInterpreter_demo.tex \
	LvInterpreter_text.tex LvInterpreter_preamble.tex LvInterpreter_demo.tex

all: $(GENERATED_TEX)

# spreadsheet

XlInterpreter_text.tex: spreadsheet/XlInterpreter.tex
	./tex_split.sh TEXT spreadsheet/XlInterpreter.tex > XlInterpreter_text.tex

XlInterpreter_preamble.tex: spreadsheet/XlInterpreter.tex
	./tex_split.sh PREAMBLE spreadsheet/XlInterpreter.tex > XlInterpreter_preamble.tex

XlInterpreter_demo.tex: spreadsheet/DemoXlInterpreter.tex
	./tex_split.sh DEMO spreadsheet/DemoXlInterpreter.tex > XlInterpreter_demo.tex

spreadsheet/XlInterpreter.tex: spreadsheet/XlInterpreter.lhs
	cd spreadsheet && make XlInterpreter.tex

spreadsheet/DemoXlInterpreter.tex: spreadsheet/DemoXlInterpreter.lhs
	cd spreadsheet && make DemoXlInterpreter.tex

# puredata

PdInterpreter_text.tex: puredata/PdInterpreter.tex
	./tex_split.sh TEXT puredata/PdInterpreter.tex > PdInterpreter_text.tex

PdInterpreter_preamble.tex: puredata/PdInterpreter.tex
	./tex_split.sh PREAMBLE puredata/PdInterpreter.tex > PdInterpreter_preamble.tex

PdInterpreter_demo.tex: puredata/PdInterpreter.tex
	./tex_split.sh DEMO puredata/PdInterpreter.tex > PdInterpreter_demo.tex

puredata/PdInterpreter.tex: puredata/PdInterpreter.lhs
	cd puredata && make PdInterpreter.tex

# lv

LvInterpreter_text.tex: lv/LvInterpreter.tex
	./tex_split.sh TEXT lv/LvInterpreter.tex > LvInterpreter_text.tex

LvInterpreter_preamble.tex: lv/LvInterpreter.tex
	./tex_split.sh PREAMBLE lv/LvInterpreter.tex > LvInterpreter_preamble.tex

lv/LvInterpreter.tex: lv/LvInterpreter.in.lhs
	cd lv && make LvInterpreter.tex

LvInterpreter_demo.tex: lv/DemoLvInterpreter.tex
	./tex_split.sh DEMO lv/DemoLvInterpreter.tex > LvInterpreter_demo.tex

lv/DemoLvInterpreter.tex: lv/DemoLvInterpreter.lhs
	cd lv && make DemoLvInterpreter.tex

#

excel_evaluation_gen.eps: excel_evaluation_gen.dot
	dot -Teps -o excel_evaluation_gen.eps excel_evaluation_gen.dot

pull:
	git pull --recurse-submodules

clean:
	rm -f $(GENERATED_TEX)
