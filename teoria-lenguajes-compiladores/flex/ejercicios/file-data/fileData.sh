# !/bin/bash

flex lexical.l

gcc ./lex.yy.c -o ../build/fileData.out

../build/fileData.out $1

rm lex.yy.c