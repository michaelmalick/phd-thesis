# PhD Thesis Makefile
# Michael Malick
# 2016-12-11

export PATH := /usr/local/texlive/2016basic/bin/universal-darwin:$(PATH)
export PATH := /usr/local/bin:$(PATH)

pdf: master.pdf

ACKNO = ./0_frontmatter/acknowledgements.tex
ABSTR = ./0_frontmatter/abstract.tex
INTRO = ./1_introduction/intro.tex
SPBLM = ./2_springbloom/springbloom.tex
NPCUR = ./3_npcurrent/npcurrent.tex
BYNET = ./4_bayesnetwork/bayesnetwork.tex
POLCY = ./5_policy/policy.tex
DISCU = ./6_discussion/discussion.tex

master.pdf: master.tex $(ACKNO) $(ABSTR) \
	$(INTRO) $(DISCU) $(SPBLM) $(NPCUR) $(BYNET) $(POLCY) makefile *.tex
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
