# Copyright (c) [2022-2032] [Boqin Qin]
# [markdown_advanced_template] is licensed under Mulan PSL v2.
# You can use this software according to the terms and conditions of the Mulan PSL v2. 
# You may obtain a copy of Mulan PSL v2 at:
#          http://license.coscl.org.cn/MulanPSL2 
# THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT, MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.  
# See the Mulan PSL v2 for more details.  

#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# -N # Add numbers to sections e.g. 1.2 Section Name
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
