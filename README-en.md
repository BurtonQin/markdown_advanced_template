---
title: "Markdown to docx/pdf with TOC、Ref and Bib"
author: "Burton Qin"
date: 2022-04-05
---

# Introduction

This is a template demonstrating how to convert markdown to docx or pdf with TOC, ref to figures, and bib (zh-cn font supported) on Linux (wsl or not).

Note that for daily usage, vscode + markdown-all-in-one extension is more than enough.

But here we want to support more advanced features: TOC, ref to figures, and bib, which are mainly for draft paper.

Prerequisits:

1. pandoc: 2.11 or higher
2. XeTeX: 3.14159265-2.6-0.999991 or higher
3. pandoc-fignos: 2.4.0
   - ```python
	  pip install pandoc-fignos
	 ```

# Footnote Example

This is a footnode example [^1].

[^1]: This is the footnode.

# Math Example

$$ E = m c^2 $$

$E$ denotes energy. $m$ denotes mass. $c$ denotes speed of light.

# Code Example

```python
def fib(n):
	if n == 0 or n == 1:
		return n
	else:
		return fib(n-2) + fib(n-1)
```

# Figure Example

Fig {@fig:index} is a gear.

![Gear](assets/index.png){#fig:index}

# Reference Example

This is the first paper. [@aaa]
These are the other papers. [@bbb;@ccc]

# Markdown to Docx Example

```bash
$ ./md2docx.sh
```

This section and above refer a lot to "How to use markdown to write paper(zh-cn)"[@markdownforpaper] by Shuyi Wang.

This config adds numbers before sections, e.g., 1.2 Section Name

```bash
-N
```

This config adds TOC (Table of Content).

```bash
--toc
```

This config adds figure numbers below each figure.

```bash
--filter pandoc-fignos
```

These configs add citation.

```--bibliography``` sets the bib file path.
Add your references into the bib file.

```--csl``` sets the citation style file path.
Use any csl you like.

```bash
--citeproc \
--bibliography=myref.bib \
--csl=chinese-gb7714-2005-numeric.csl \
```

This config highlights the code block.

```bash
--highlight-style zenburn
```

This shell lists the supported hightlight langues and styles.

```bash
pandoc --list-highlight-languages
pandoc --list-highlight-styles
```

# Markdown to pdf Example

```bash
$ ./md2pdf.sh
```

This section refers a lot to "Converting Markdown to Beautiful PDF with Pandoc"[@markdown2pdf] by jdhao.

xelatex supports zh-cn better than pdflatex.

This config sets the font. Use any installed font you like.

```bash
-V mainfont='Noto Sans Mono CJK SC'
```

This shell shows the installed font for zh-cn on Linux.

```bash
$ fc-list :lang=zh-cn
```

You can copy zh-cn ttf or otf to the font directory, e.g., ```/usr/share/fonts/YourFontName/```, if there is none.

The default margin is too large.
This config shrinks it. 

```bash
-V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm"
```

# Reference