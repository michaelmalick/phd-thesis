# PhD Thesis Makefile
# Michael Malick
# 2017-04-20

export PATH := /usr/local/texlive/2016basic/bin/universal-darwin:$(PATH)
export PATH := /usr/local/bin:$(PATH)

pdf: defense-booklet.pdf

defense-booklet.pdf: defense-booklet.tex
	latexmk -pdf $<
	rm -f *.{aux,bbl,blg,fls,fdb_latexmk,lof,lot,toc,out}

clean:
	rm -f *.{pdf,doc,docx}
