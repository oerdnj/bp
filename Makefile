all: Thesis.pdf

view: all
	acroread Thesis.pdf

count: Thesis.tex
	detex Thesis.tex | wc

Thesis.aux Thesis.toc: Thesis.tex
	pdfcslatex -draftmode -interaction=batchmode Thesis

Thesis.bbl: Literatura.bib Thesis.tex Thesis.aux
	bibtex Thesis

Thesis.pdf: Thesis.aux Thesis.toc Thesis.bbl
	pdfcslatex -draftmode -interaction=batchmode Thesis
	pdfcslatex -interaction=batchmode Thesis

clean:
	rm -f Thesis.aux Thesis.bbl Thesis.blg Thesis.log Thesis.toc Thesis.pdf
