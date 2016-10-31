# add LaTeX and Rscript paths
export PATH := /usr/local/texlive/2016basic/bin/universal-darwin:$(PATH) 
export PATH := /usr/local/bin:$(PATH) 
PANDOC = pandoc

pdf: \
	./2_introduction/intro.tex \
	./7_discussion/discussion.tex \
	master.pdf
	# ./3_springbloom/springbloom.tex \

# Files
ACKNO = ./1_frontmatter/acknowledgements.tex
INTRO = ./2_introduction/intro.md
SPBLM = ./3_springbloom/springbloom.tex
BYNET = ./4_bayesnetwork/bayesnetwork.tex
DISCU = ./7_discussion/discussion.md

# Pandoc
BIB  = --bibliography ~/Documents/pandoc/bibtex-files/master.bib
CSL  = --csl ~/Documents/pandoc/csl-citations/cjfas.csl 
ABV  = --citation-abbreviations ~/Documents/pandoc/csl-citations/abbrev.json


./2_introduction/intro.tex: $(INTRO) makefile
	$(PANDOC) --chapters -o  $@ $<

# ./3_springbloom/springbloom.tex: $(SPBLM) makefile
	# $(PANDOC) --chapters -S $(BIB) $(CSL) $(ABV) -o $@ $<
	# $(PANDOC) --chapters -S $(BIB) --natbib -o $@ $<

./7_discussion/discussion.tex: $(DISCU) makefile
	$(PANDOC) --chapters -o $@ $<

master.pdf: master.tex $(ACKNO) $(INTRO) $(DISCU) $(SPBLM) $(BYNET) makefile *.tex 
	cp -r ~/Documents/research/phd-spring-bloom/thesis/figures ./3_springbloom
	cp -r ~/Documents/research/phd-spring-bloom/thesis/tables ./3_springbloom
	cp -r ~/Documents/research/phd-bayesian-network/thesis/figures ./4_bayesnetwork
	cp -r ~/Documents/research/phd-bayesian-network/thesis/tables ./4_bayesnetwork
	latexmk -pdf $<
	rm -f *.{aux,bbl,blg,log,fls,fdb_latexmk,lof,lot,toc,out}

clean:
	rm -f *.{pdf,doc,docx}

