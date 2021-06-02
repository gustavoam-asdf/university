# !/bin/bash

flex lexical.l

gcc ./lex.yy.c -o ../build/wordFrecuency.out

../build/wordFrecuency.out $1

rm lex.yy.c