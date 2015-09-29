export PATH := /usr/texbin:$(PATH)    # add LaTeX path
export PATH := /usr/local/bin:$(PATH) # add Rscript path
PANDOC = pandoc

pdf: \
	./2_introduction/intro.tex \
	./3_springbloom/springbloom.tex \
	./7_discussion/discussion.tex \
	master.pdf

# Files
INTRO = ./2_introduction/intro.md
SPBLM = ./3_springbloom/springbloom.tex
DISCU = ./7_discussion/discussion.md

# Pandoc
BIB  = --bibliography ~/Documents/pandoc/bibtex-files/master.bib
CSL  = --csl ~/Documents/pandoc/csl-citations/cjfas.csl 
ABV  = --citation-abbreviations ~/Documents/pandoc/csl-citations/abbrev.json


./2_introduction/intro.tex: $(INTRO) makefile
	$(PANDOC) --chapters -o  $@ $<

./3_springbloom/springbloom.tex: $(SPBLM) makefile
	# $(PANDOC) --chapters -S $(BIB) $(CSL) $(ABV) -o $@ $<
	cp -r ~/Documents/research/phd-spring-bloom/thesis/figures ./3_springbloom
	cp -r ~/Documents/research/phd-spring-bloom/thesis/tables ./3_springbloom
	# $(PANDOC) --chapters -S $(BIB) --natbib -o $@ $<

./7_discussion/discussion.tex: $(DISCU) makefile
	$(PANDOC) --chapters -o $@ $<

master.pdf: master.tex $(INTRO) $(DISCU) $(SPBLM) makefile *.tex 
	latexmk -pdf $<
	rm -f *.{aux,bbl,blg,log,fls,fdb_latexmk,lof,lot,toc,out}

clean:
	rm -f *.{pdf,doc,docx}
