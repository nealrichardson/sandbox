#!/bin/bash

set -x

bash --version

shopt -u complete_fullquote
shopt -s expand_aliases
shopt -s extglob
shopt -s globasciiranges
shopt -s globstar


shopt

find . -name .md
V='*.md'
ls $V
