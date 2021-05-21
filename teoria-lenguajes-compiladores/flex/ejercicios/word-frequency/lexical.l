%{
  #include <stdio.h>
  #include <stdlib.h>
  FILE *yyin;
  struct WordDetail {
    char* word;
    int repeat;
  };

  struct node {
    struct WordDetail wordDetail;
    struct node *next;
  };

  void addNode(struct WordDetail wordDetail);
  void addWord(char* palabra);
  void showWords(void);

%}

/* Options */
%option noyywrap

/* Tokens */
letter          [a-zA-ZáéíóúÁÉÍÓÚñÑ]
noletter        [-_;:,"'»¡!\?\.\n\s\t]

word            {letter}+
/* Rules */
%%
{word}          {
  printf("\nPalabra: '%s'", yytext);
}      
{noletter}      {}

%%
int main(int argc, char *argv[]) {
  
  yyin = fopen(argv[1], "rt");
  if ( yyin == NULL) {
    printf ("Error al leer el archivo: %s\n", argv[1]);
    exit(1);
  }

  yylex();
  fclose(yyin);
  printf ("\n\nProceso terminado...\n");
  exit(0);
}

int yyerror(void) {
  printf ("\nError lexico: Caracter invalido: %s, saliendo...\n", yytext);
  exit(1);
}

