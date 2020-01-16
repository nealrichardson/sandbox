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

ls

find . -name "*.md"

ls | grep -e "\.md"

ls "*.md"
