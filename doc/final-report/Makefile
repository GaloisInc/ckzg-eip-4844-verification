PDFLATEX=pdflatex

all : clean-all pdf clean

pdf : galois-final-report.pdf

galois-final-report.pdf : galois-final-report.tex
	latexmk -pdf -jobname=galois-final-report galois-final-report.tex

clean :
	rm -f *.aux *.dvi *.ps *.log *.bbl *.blg *~ *.out *.toc *.fdb_latexmk *.fls

clean-all :
	rm -f *.aux *.dvi *.ps *.log *.bbl *.blg *.pdf *~ *.out *.toc *.fdb_latexmk *.fls
