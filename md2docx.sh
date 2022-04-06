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
