# This makefile makes a pdf of the general abstract only
#
# add LaTeX and Rscript paths
export PATH := /usr/local/texlive/2015basic/bin/universal-darwin:$(PATH)
export PATH := /usr/local/bin:$(PATH)
PANDOC = pandoc

all: abstract.pdf abstract.docx
pdf: abstract.pdf
doc: abstract.docx

BIB  = --bibliography ~/Documents/literature/bibtex/library.bib
CSL  = --csl ~/Documents/pandoc/csl-citations/cjfas.csl
ABV  = --citation-abbreviations ~/Documents/pandoc/csl-citations/abbrev.json
WTMP = --reference-docx ../../pandoc/template.docx
MRG  = -V geometry:margin=1in
SMRG = -V geometry:margin=1in
FONT = --variable fontsize=12pt


abstract.pdf: abstract.md makefile
	$(PANDOC) -s -S $(BIB) $(CSL) $(ABV) -o $@ $<

abstract.docx: abstract.md makefile
	$(PANDOC) -s -S $(BIB) $(CSL) $(ABV) $(WTMP) -o $@ $<

clean:
	rm -f *.{pdf,doc,docx}
