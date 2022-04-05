#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# -N # Add numbers to sections e.g. 1.2 Section
# --toc # Add TOC
# --filter pandoc-fignos # Add fig no
# --citeproc # Add cite
# --bibliography=myref.bib # Cite from
# --csl=chinese-gb7714-2005-numeric.csl # Cite format
# --highlight-style zenburn # Hightlight code

pandoc \
	-N \
	--toc \
	--filter pandoc-fignos \
	--citeproc \
	--bibliography=myref.bib \
	--csl=chinese-gb7714-2005-numeric.csl \
	--highlight-style zenburn \
	README.md -o README.docx
