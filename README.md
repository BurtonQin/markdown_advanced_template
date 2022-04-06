---
title: "将Markdown转成带目录、引用和参考文献的docx或pdf"
author: "Burton Qin"
date: 2022-04-05
---

# 引言

本项目是一个模板，用于演示如何在Linux（含wsl）上将 Markdown 转换为 docx 或 pdf，并带有目录、对图的引用和参考文献，并支持中文字体。

注意对日常使用来说，vscode + markdown-all-in-one插件绰绰有余。

但这里我们要支持更高级的功能：目录、对图的引用和参考文献，主要用于论文草稿。

预先安装


1. pandoc: 2.11及以上
2. xelatex: 3.14159265-2.6-0.999991及以上
3. pandoc-fignos: 2.4.0
   - ```python 
	  pip install pandoc-fignos
	 ```

# 脚注示例

这是一个脚注示例 [^1]。

[^1]:这是脚注。

# 数学示例

$$ E = m c^2 $$

$E$表示能量，$m$表示质量，$c$表示光速。

# 代码示例

```python
def fib(n):
	if n == 0 or n == 1:
		return n
	else:
		return fib(n-2) + fib(n-1)
```

# 图示例

图{@fig:index}是个齿轮。

![Gear](assets/index.png){#fig:index}

# 引文示例

这是第一篇论文。[@aaa]
这是其他的论文。[@bbb;@ccc]

# Markdown转docx示例

```bash
$ ./md2docx.sh
```

本节和以上很多内容参考了王树义老师的"如何用Markdown写论文？"[@markdownforpaper]。

该配置加了章节号，比如 1.2 章节名。

```bash
-N
```

该配置加了目录。

```bash
--toc
```

该配置为每幅图加了图号。

```bash
--filter pandoc-fignos
```

该配置加引用。

```--bibliography```设置bib文件路径。
把你的引文加入bib文件中。

```--csl```设置引用样式文件路径。
使用任何你喜欢的csl。

```bash
--citeproc \
--bibliography=myref.bib \
--csl=chinese-gb7714-2005-numeric.csl \
```

该配置高亮代码块。

```bash
--highlight-style zenburn
```

该shell列出了支持的高亮语言和样式。

```bash
pandoc --list-highlight-languages
pandoc --list-highlight-styles
```

# Markdown转pdf示例

```bash
$ ./md2pdf.sh
```

本节很多内容参考了jdhao老师的"Converting Markdown to Beautiful PDF with Pandoc"[@markdown2pdf]。

比起pdflatex，xelatex对中文的支持更好。

配置字体。使用你喜欢的任何已安装字体。

```bash
-V mainfont='Noto Sans Mono CJK SC'
```

该shell用于查看在Linux上安装了的中文字体

```bash
$ fc-list :lang=zh-cn
```

若没安装中文字体，你可以将中文字体的ttf或otf文件复制到字体目录，如```/usr/share/fonts/YourFontName/```。

默认的边距太大。
该配置可缩小边距。

```bash
-V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm"
```

# 参考文献