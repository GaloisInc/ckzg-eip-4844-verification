PDFLATEX=pdflatex

all : clean-all pdf clean

pdf : galois-consensys-audit-report.pdf

galois-consensys-audit-report.pdf : galois-consensys-audit-report.tex
	latexmk -pdf -jobname=galois-consensys-audit-report galois-consensys-audit-report.tex

clean :
	rm -f *.aux *.dvi *.ps *.log *.bbl *.blg *~ *.out *.toc *.fdb_latexmk *.fls

clean-all :
	rm -f *.aux *.dvi *.ps *.log *.bbl *.blg *.pdf *~ *.out *.toc *.fdb_latexmk *.fls
