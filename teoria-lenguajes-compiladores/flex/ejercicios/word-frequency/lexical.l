%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <stdbool.h>

  #define MAX_WORD_LENGTH 100

  struct WordDetail {
    char word[MAX_WORD_LENGTH];
    int frequency;
  };

  struct Node {
    struct WordDetail wordDetail;
    struct Node *next;
  };

  FILE *yyin;
  struct Node *cursor = NULL;

  bool equealStrings (char firstWord[MAX_WORD_LENGTH], char secondWord[MAX_WORD_LENGTH]) {
    return strcasecmp(firstWord, secondWord) == 0 ? true : false;
  }

  void addNode(struct WordDetail wordDetail) {
    // El nodo que se agregará; reservamos memoria
    struct Node *newNode = malloc(sizeof(struct Node));
    // Le ponemos el dato
    newNode->wordDetail = wordDetail;
    /* 
      El nodo siguiente (next) del nuevo nodo (new node) es el nodo cursor
      y el nodo siguiente pasa a ser el cursor
    */
    newNode->next = cursor;
    cursor = newNode;
  }

  void addWord(char word[MAX_WORD_LENGTH]) {
    struct Node *newCursor = cursor;
    while (newCursor != NULL) {
      if (equealStrings(newCursor->wordDetail.word, word)) {
        newCursor->wordDetail.frequency++;
        return;
      }
      newCursor = newCursor->next;
    }

    // Si no encontramos nada, agregamos una nueva
    struct WordDetail wordDetail;
    strcpy(wordDetail.word, word);
    wordDetail.frequency = 1; // La primera vez es 1
    addNode(wordDetail);
  }

  void showWords() {
    char separator[] = "--------------------";
    printf("+%s+%s+\n", separator, separator);
    printf("|%-20s|%-20s|\n", "PALABRA", "FRECUENCIA");
    printf("+%s+%s+\n", separator, separator);

    // A partir de aquí el código sí importa; simplemente recorremos la pila
    struct Node *newCursor = cursor;
    while (newCursor != NULL)
    { 
      printf ("|%-20s|\t%-20d|\n", newCursor->wordDetail.word, newCursor->wordDetail.frequency);
      newCursor = newCursor->next;
    }
    printf("+%s+%s+\n", separator, separator);
  }

%}

/* Options */
%option noyywrap

/* Tokens */
letter          [a-zA-ZáéíóúÁÉÍÓÚñÑ]
noletter        [-_;:,"'»¡!\?\.\n\s\t]

word            {letter}+
/* Rules */
%%
{word}          { addWord(yytext); }      
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
  showWords();
  if (argv[2] != NULL) {

  }
  printf ("\n\nProceso terminado...\n");
  exit(0);
}

int yyerror(void) {
  printf ("\nError lexico: Caracter invalido: %s, saliendo...\n", yytext);
  exit(1);
}

