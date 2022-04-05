#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# -N # Add numbers to sections e.g. 1.2 Section
# --toc # Add TOC
# --pdf-engine=xelatex # This engine supports Chinese characters
# -V mainfont='Noto Sans Mono CJK SC:style=Regular' # Font type
# -V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm" # Set the margin
# --filter pandoc-fignos # Add fig no
# --citeproc # Add cite
# --bibliography=myref.bib # Cite from
# --csl=chinese-gb7714-2005-numeric.csl # Cite format
# --highlight-style zenburn # Hightlight code

pandoc \
	-N \
	--toc \
	--pdf-engine=xelatex \
	-V mainfont='Noto Sans Mono CJK SC' \
	-V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm" \
	--filter pandoc-fignos \
	--citeproc \
	--bibliography=myref.bib \
	--csl=chinese-gb7714-2005-numeric.csl \
	--highlight-style tango \
	README.md -o README.pdf
