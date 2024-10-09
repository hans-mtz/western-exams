# Makefile for rendering Quarto documents to PDFs with different versions

# Find all .qmd files in the current directory
SOURCES := $(wildcard *.qmd)
# RAWSOURCES := $(wildcard *.qmd)
# EXCLUDE := $(wildcard _*.qmd)
# SOURCES := $(filter-out $(EXCLUDE),$(RAWSOURCES))
# Define version suffixes and associated options
VERSIONS := A B C D
SEEDS := 666 777 888 999

# Define the output PDFs for each source and version
OUTPUTS := $(foreach src,$(SOURCES),$(foreach ver,$(VERSIONS),$(basename $(src))-$(ver).pdf))
AKOUTPUTS := $(foreach src,$(SOURCES),$(foreach ver,$(VERSIONS),$(basename $(src))-$(ver)-AK.pdf))

# Default target
all: $(OUTPUTS)

answers: $(AKOUTPUTS)

# Rule to render PDFs with different versions and seeds
# $(OUTPUTS): $(basename %).pdf: %.qmd
# 	quarto render $< -o $@ -M exam-version: -M set-seed: 

# $(AKOUTPUTS): $(basename %).pdf: %.qmd
# 	quarto render $< -o $@ -M print-keytable:true -M exam-version: -M set-seed: 

$(basename %)-A.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:A -M set-seed:666

$(basename %)-B.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:B -M set-seed:777

$(basename %)-C.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:C -M set-seed:888

$(basename %)-D.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:D -M set-seed:999

$(basename %)-A-AK.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:A -M set-seed:666 -M print-

$(basename %)-B-AK.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:B -M set-seed:777 -M print-

$(basename %)-C-AK.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:C -M set-seed:888 -M print-

$(basename %)-D-AK.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:D -M set-seed:999 -M print-keytable:true


# Clean target to remove generated PDFs
clean:
	rm -f $(OUTPUTS)

clean-tex:
	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
	rm -fv *.fdb_latexmk *.fls

.PHONY: all answers clean clean-tex

