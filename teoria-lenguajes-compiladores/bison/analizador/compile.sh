bison -d -o analizadorSintactico.c sintactico.y
flex -o analizadorLexico.c lexico.l

gcc analizadorLexico.c -o main.out

./main.out $1

rm ./analizadorLexico.c
rm ./analizadorSintactico.c
rm ./analizadorSintactico.h
rm ./main.out