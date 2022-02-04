topsrc = ../../..
TEXDIR = $(topsrc)/doc/tex

PKG = BACE
DOCDIR = $(topsrc)/addons/$(PKG)/doc

SRCS = $(PKG).bib $(PKG).tex 

$(PKG).pdf: $(SRCS)
	@pdflatex $(PKG) && bibtex $(PKG) && pdflatex $(PKG) && pdflatex $(PKG)
	@if grep 'Rerun to get' $(PKG).log ; then pdflatex $(PKG) ; fi

clean:
	@rm -f *.log *.aux *.bbl *.blg *.toc *.out $(PKG).pdf
