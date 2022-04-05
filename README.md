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
2. pandoc-fignos: 2.4.0
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

以上很多内容参考了王树义老师的"如何用Markdown写论文？"[@markdownforpaper]。

# Markdown转pdf示例

```bash
$ ./md2pdf.sh
```

本节很多内容参考了jdhao老师的"Converting Markdown to Beautiful PDF with Pandoc"[@markdown2pdf]。

比起pdflatex，xelatex对中文的支持更好。

配置字体

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

在myref.bib中加入参考文献，*.csl控制参考文献的格式。

# 参考文献