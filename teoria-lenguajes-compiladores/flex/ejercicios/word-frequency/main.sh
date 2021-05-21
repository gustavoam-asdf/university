# !/bin/bash

flex lexical.l

gcc ./lex.yy.c -o compiled.out

./compiled.out $1

rm compiled.out

rm lex.yy.c