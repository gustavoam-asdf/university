%{
  #include <stdio.h>
  #include <stdbool.h>

  #define MAX_WORD_LENGTH 100

  FILE *yyout;
  char* receivedWord;
  char* targetWord;

  bool equealStrings (char firstWord[MAX_WORD_LENGTH], char secondWord[MAX_WORD_LENGTH]) {
    return strcasecmp(firstWord, secondWord) == 0 ? true : false;
  }

%}

/* Options */
%option noyywrap

/* Tokens */
character       .|\n
word            [a-zA-ZáéíóúÁÉÍÓÚñÑ]+
/* Rules */
%%

{word}            {
  if (equealStrings(yytext, receivedWord)) {
    fprintf(yyout, "%s", targetWord);
  } else {
    fprintf(yyout, "%s", yytext);
  }
}

{character}      {
  fprintf(yyout, "%s",yytext);
}

%%
int main(int argc, char *argv[]) {
  
  if (argc < 4) { 
    printf ("Debe ingresar la palabra que saldra y la palabra que ingresara");
    exit(1);
  }

  yyin = fopen(argv[1], "rt");
  yyout = fopen("./output.txt", "wt");
  receivedWord = argv[2];
  targetWord = argv[3];

  if ( yyin == NULL) {
    printf ("Error al leer el archivo: %s\n", argv[1]);
    exit(1);
  }

  yylex();
  fclose(yyin);
  fclose(yyout);
  printf ("\nProceso terminado...\n\n");
  exit(0);
}

int yyerror(void) {
  printf ("\nError lexico: Caracter invalido: %s, saliendo...\n", yytext);
  exit(1);
}

