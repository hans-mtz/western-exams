# Makefile for rendering Quarto documents to PDFs with different versions

# Find all .qmd files in the current directory
SOURCES := $(wildcard *.qmd)
# RAWSOURCES := $(wildcard *.qmd)
# EXCLUDE := $(wildcard _*.qmd)
# SOURCES := $(filter-out $(EXCLUDE),$(RAWSOURCES))
# Define version suffixes and associated options
VERSIONS := V111 V222 V333
SEEDS := 777 888 999

# Define the output PDFs for each source and version
OUTPUTS := $(foreach src,$(SOURCES),$(foreach ver,$(VERSIONS),$(basename $(src))-$(ver).pdf))
AKOUTPUTS := $(foreach src,$(SOURCES),$(foreach ver,$(VERSIONS),$(basename $(src))-$(ver)-AK.pdf))

# Default target
all: $(OUTPUTS)

answers: $(AKOUTPUTS)

# Rule to render PDFs with different versions and seeds
$(basename %)-V111.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:V111 -M set-seed:777

$(basename %)-V222.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:V222 -M set-seed:888

$(basename %)-V333.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:V333 -M set-seed:999

$(basename %)-V111-AK.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:V111 -M set-seed:777 -M print-keytable:true 

$(basename %)-V222-AK.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:V222 -M set-seed:888 -M print-keytable:true

$(basename %)-V333-AK.pdf: %.qmd
	quarto render $< -o $@ -M exam-version:V333 -M set-seed:999 -M print-keytable:true


# Clean target to remove generated PDFs
clean:
	rm -f $(OUTPUTS)

clean-tex:
	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
	rm -fv *.fdb_latexmk *.fls

.PHONY: all answers clean clean-tex

