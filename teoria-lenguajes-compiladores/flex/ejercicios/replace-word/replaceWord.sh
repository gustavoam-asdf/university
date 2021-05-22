# !/bin/bash

flex lexical.l

gcc ./lex.yy.c -o ../build/replaceWord.out

../build/replaceWord.out $1 $2 $3

rm lex.yy.c