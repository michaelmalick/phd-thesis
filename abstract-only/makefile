# PhD Thesis Makefile
# Michael Malick
# 2016-12-11

export PATH := /usr/local/texlive/2016basic/bin/universal-darwin:$(PATH)
export PATH := /usr/local/bin:$(PATH)

pdf: abstract-only.pdf

abstract-only.pdf: abstract-only.tex
	latexmk -pdf $<
	rm -f *.{aux,bbl,blg,fls,fdb_latexmk,lof,lot,toc,out}

clean:
	rm -f *.{pdf,doc,docx}
