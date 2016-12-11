# add LaTeX and Rscript paths
export PATH := /usr/local/texlive/2016basic/bin/universal-darwin:$(PATH)
export PATH := /usr/local/bin:$(PATH)
PANDOC = pandoc

# pdf: \
# 	./1_introduction/intro.tex \
# 	./6_discussion/discussion.tex \
# 	master.pdf

pdf: master.pdf

# Files
ACKNO = ./0_frontmatter/acknowledgements.tex
INTRO = ./1_introduction/intro.tex
SPBLM = ./2_springbloom/springbloom.tex
NPCUR = ./3_npcurrent/npcurrent.tex
BYNET = ./4_bayesnetwork/bayesnetwork.tex
POLCY = ./5_policy/policy.tex
DISCU = ./6_discussion/discussion.tex

# Pandoc
BIB  = --bibliography ~/Documents/pandoc/bibtex-files/master.bib
CSL  = --csl ~/Documents/pandoc/csl-citations/cjfas.csl
ABV  = --citation-abbreviations ~/Documents/pandoc/csl-citations/abbrev.json


# ./1_introduction/intro.tex: $(INTRO) makefile
# 	$(PANDOC) --chapters -o  $@ $<

# ./6_discussion/discussion.tex: $(DISCU) makefile
# 	$(PANDOC) --chapters -o $@ $<

master.pdf: master.tex $(ACKNO) $(INTRO) $(DISCU) $(SPBLM) $(NPCUR) $(BYNET) makefile *.tex
	cp -r ~/Documents/research/phd-spring-bloom/thesis/figures ./2_springbloom
	cp -r ~/Documents/research/phd-spring-bloom/thesis/tables ./2_springbloom
	cp -r ~/Documents/research/phd-np-current/thesis/figures ./3_npcurrent
	cp -r ~/Documents/research/phd-np-current/thesis/tables ./3_npcurrent
	cp -r ~/Documents/research/phd-bayesian-network/thesis/figures ./4_bayesnetwork
	cp -r ~/Documents/research/phd-bayesian-network/thesis/tables ./4_bayesnetwork
	cp -r ~/Documents/research/phd-policy/figures/thesis/figures ./5_policy
	latexmk -pdf $<
	rm -f *.{aux,bbl,blg,fls,fdb_latexmk,lof,lot,toc,out}

clean:
	rm -f *.{pdf,doc,docx}
