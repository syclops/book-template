PAPER = paper
LATEXMK = latexmk
FLAGS = -pdf
CLEAN_FLAGS = -c
CLEAN_FULL_FLAGS = -C

.PHONY = all paper clean clean-full

all: paper

paper:
	$(LATEXMK) $(FLAGS) $(PAPER)

clean:
	$(LATEXMK) $(CLEAN_FLAGS) $(PAPER)

clean-full:
	$(LATEXMK) $(CLEAN_FULL_FLAGS) $(PAPER)
