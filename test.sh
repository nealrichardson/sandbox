#!/bin/bash

set -x

bash --version

shopt -u complete_fullquote
shopt -s expand_aliases
shopt -s extglob
shopt -s globasciiranges
shopt -s globstar


shopt

cd $APPVEYOR_BUILD_FOLDER

touch file2.md

ls
find . -name "*.md"

ls | grep -e "\.md"

mkdir test

find . -name "*.md" | xargs -I{} cp {} test/
ls test

cd test
ls
rm *.md
find . -name "*.md" | rm
