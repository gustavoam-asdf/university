flex lexical.l
gcc lex.yy.c -o ./main.out
./main.out $1

rm ./main.out
rm ./lex.yy.c