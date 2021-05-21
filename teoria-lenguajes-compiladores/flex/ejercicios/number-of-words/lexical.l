%{
  #include <stdio.h>
  #include <stdlib.h>
  FILE *yyin;
  struct counter {
    char* word;
    int repeat;
  };
%}

/* Options */
%option noyywrap

/* Tokens */
letter          [a-zA-ZáéíóúÁÉÍÓÚñÑ]
word            {letter}+

/* Rules */
%%
{word}          {
  printf("\n Palabra encontrada: (%s)", yytext);
  
}      

%%
int main(int argc, char *argv[]) {
  
  yyin = fopen(argv[1], "rt");
  if ( yyin == NULL) {
    printf ("Error al leer el archivo: %s\n", argv[1]);
    exit(1);
  }

  yylex();
  fclose(yyin);
  printf ("\nProceso terminado\n");
  exit(0);
}

int yyerror(void) {
  printf ("\nError lexico: Caracter invalido: %s, saliendo...\n", yytext);
  exit(1);
}

