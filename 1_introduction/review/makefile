# This makefile makes a pdf of the general intro only
#
# add LaTeX and Rscript paths
export PATH := /usr/local/texlive/2015basic/bin/universal-darwin:$(PATH)
export PATH := /usr/local/bin:$(PATH)
PANDOC = pandoc

all: intro.pdf intro.docx figures.pdf
pdf: intro.pdf figures.pdf
doc: intro.docx figures.pdf

BIB  = --bibliography ~/Documents/literature/bibtex/library.bib
CSL  = --csl ~/Documents/pandoc/csl-citations/cjfas.csl
ABV  = --citation-abbreviations ~/Documents/pandoc/csl-citations/abbrev.json
WTMP = --reference-docx ../../pandoc/template.docx
MRG  = -V geometry:margin=1in
SMRG = -V geometry:margin=1in
FONT = --variable fontsize=12pt


intro.pdf: intro.md makefile
	$(PANDOC) -s -S $(BIB) $(CSL) $(ABV) -o $@ $<

intro.docx: intro.md makefile
	$(PANDOC) -s -S $(BIB) $(CSL) $(ABV) $(WTMP) -o $@ $<

figures.pdf: figs.md makefile ../figures/*.pdf
	$(PANDOC) -s $(MRG) $(FONT) -o  $@ $<

clean:
	rm -f *.{pdf,doc,docx}
