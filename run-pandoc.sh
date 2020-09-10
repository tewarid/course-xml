#!/bin/sh
# create standalone revealjs presentation
pandoc -F mermaid-filter --slide-level=2 -o slides.html -t revealjs -s -V minScale=0.2 -V maxScale=1.5 -V width=\"100%\" -V height=\"150%\" -V margin=0.05 front-matter.md xml.md dtd.md schema.md dom.md sax.md css.md xsl.md
# create PowerPoint
pandoc -F mermaid-filter --slide-level=2 -o slides.pdf -t beamer front-matter.md xml.md dtd.md schema.md dom.md sax.md css.md xsl.md
