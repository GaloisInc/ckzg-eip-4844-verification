PDFLATEX=pdflatex

all : clean-all pdf clean

pdf : galois-whitepaper-audit-report.pdf

galois-whitepaper-audit-report.pdf : galois-whitepaper-audit-report.tex 
	$(PDFLATEX) -jobname galois-whitepaper-audit-report galois-whitepaper-audit-report.tex

clean : 
	rm -f *.aux *.dvi *.ps *.log *.bbl *.blg *~ *.out

clean-all : 
	rm -f *.aux *.dvi *.ps *.log *.bbl *.blg *.pdf *~ *.out
