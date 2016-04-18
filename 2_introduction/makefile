# This makefile makes a pdf of the general intro only
#
# add LaTeX and Rscript paths
export PATH := /usr/local/texlive/2015basic/bin/universal-darwin:$(PATH)
export PATH := /usr/local/bin:$(PATH)
PANDOC = pandoc

pdf: intro.pdf

BIB  = --bibliography ~/Documents/literature/bibtex/library.bib
CSL  = --csl ~/Documents/pandoc/csl-citations/cjfas.csl
ABV  = --citation-abbreviations ~/Documents/pandoc/csl-citations/abbrev.json
MRG  = -V geometry:margin=1in
SMRG = -V geometry:margin=1in
FONT = --variable fontsize=12pt


intro.pdf: intro.md makefile
	$(PANDOC) -s -S $(BIB) $(CSL) $(ABV) -o $@ $<

clean:
	rm -f *.{pdf,doc,docx}
