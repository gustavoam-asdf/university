yacc -d ./parser.y
lex ./lexical.l

gcc ./lex.yy.c ./y.tab.c -o ./main.out

rm ./lex.yy.c
rm ./y.tab.c
rm ./y.tab.h