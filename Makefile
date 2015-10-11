PAPERNAME=paper

$(PAPERNAME): $(PAPERNAME).tex setup.tex bib.bib chp/*.tex sec/*
	pdflatex $(PAPERNAME)
	bibtex $(PAPERNAME)
	pdflatex $(PAPERNAME)
	pdflatex $(PAPERNAME)

fastcompile:
	latex paper
	dvips -Ppdf -G0 -t letter -o $(PAPERNAME).ps paper
	ps2pdf -dCompatibilityLevel=1.3 $(PAPERNAME).ps

mate:
	pdflatex -synctex=1 -interaction nonstopmode $(PAPERNAME)

gv: $(PAPERNAME).ps
	gv $(PAPERNAME).ps &

tar:
	tar -cvzf $(PAPERNAME).tar.gz *.tex *.bib *.bst *.perl *.pl makefile

clean:
	rm -f $(PAPERNAME).ps $(PAPERNAME).pdf *.dvi *.aux *.log *.blg *.bbl *~
