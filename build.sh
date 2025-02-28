#!/bin/bash

mupdf mid.pdf &

set -xe

compile(){
#pandoc -t beamer --pdf-engine=xelatex mid_sem_ppt.md -o mid_sem_ppt.pdf
quarto render Markdown mid.qmd --to revealjs
pkill -SIGHUP mupdf
}

export -f compile

echo "mid.qmd" | entr -sc compile
