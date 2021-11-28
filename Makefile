MEXT = md

SRC = $(wildcard *.$(MEXT))

PDF=$(SRC:.md=.pdf)
PDFS=$(SRC:.md=_small_margin.pdf)

all:	clean $(PDF) $(PDFS)

pdf:	clean $(PDF)

%.pdf: %.md
	pandoc -V papersize:a4 -V geometry:margin=2cm -o $@ $<

pdfs:	clean $(PDFS)

%_small_margin.pdf: %.md
	pandoc -V papersize:a4 -V geometry:margin=1.2cm -o $@ $<

clean:
	rm -f $(SRC:.md=_small_margin.pdf) $(SRC:.md=.pdf)
