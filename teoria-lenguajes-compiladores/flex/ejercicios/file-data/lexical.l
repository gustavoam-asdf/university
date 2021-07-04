%{
  #include <stdio.h>

  int characters = 0;
  int words = 0;
  int lines = 0;
%}

%%

[^ \t\n]+ { words++; characters += yyleng; }
[ \t]+ { characters += yyleng; }
\n { lines++; characters++; }


%%
int main(int argc, char *argv[]) {
  
  yyin = fopen(argv[1], "rt");
  if ( yyin == NULL) {
    printf ("Error al leer el archivo: %s\n", argv[1]);
    exit(1);
  }

  yylex();
  fclose(yyin);
  printf ("Dígitos: %d, Palabras: %d, Lineas: %d", characters, words, lines);
  printf ("\n\nProceso terminado...\n");
  exit(0);
}

int yyerror(void) {
  printf ("\nError lexico: Caracter invalido: %s, saliendo...\n", yytext);
  exit(1);
}

int yywrap(void) {
  lines++;
}

