%{
  void yyerror(char *s);
  #include <stdio.h>
%}

%union {int num; char id;}
%start line
%token print
%token type
%token IF ELSE WHILE COMILLAS LESS_EQUAL GREATER_EQUAL EQUAL DIFFERENT AND OR TRUE FALSE
%token INCREMENT DECREMENT

%token <num> number
%token <id> IDENTIFIER

%type <num> line VARIABLE TERM CONDITIONAL
%type <id> ASSIGNMENT

%%

line              : DECLARATION ';' {;}
                  | WHILE '(' EXPRESSION ')' stmt { printf("Estructura de control WHILE válida\n"); }
                  | ASSIGNMENT ';' {;}
                  | CONDITIONAL    {;}
                  | print '(' VARIABLE ')' ';' { printf("Impresión válida\n"); }
                  
                  | line WHILE '(' EXPRESSION ')' stmt { printf("WHILE\n"); }
                  | line DECLARATION ';' {;}
                  | line CONDITIONAL {;}
                  | line ASSIGNMENT ';'
                  | line print '(' VARIABLE ')' ';' { printf("Impresión válida\n"); }
                  ; 

DECLARATION       : type IDENTIFIER ',' {;}
                  | type IDENTIFIER             { printf("Declaración de variable válida\n"); }
                  | type IDENTIFIER '=' VARIABLE { printf("Declaración y asinación de variable válida\n"); }
                  | type IDENTIFIER '=' COMILLAS VARIABLE COMILLAS  { printf("Declaración y asignación de una cadena válida\n");}
                  | DECLARATION IDENTIFIER  { printf("Declaración de variables\n"); }
                  ;

ASSIGNMENT        : IDENTIFIER '=' VARIABLE { printf("Asignación de valor a variable válida\n"); }
                  | IDENTIFIER '=' COMILLAS IDENTIFIER COMILLAS { printf("String válida\n"); }
                  | IDENTIFIER INCREMENT    { printf("Incremento por la derecha válido\n"); }
                  | IDENTIFIER DECREMENT    { printf("Decremento por la derecha válido\n"); }
                  | INCREMENT IDENTIFIER    { printf("Incremento por la izquierda válido\n"); }
                  | DECREMENT IDENTIFIER    { printf("Incremento por la izquierda válido\n"); }
                  ;

CONDITIONAL       : IF '(' EXPRESSION ')' stmt {;}
                  | IF '(' EXPRESSION ')' stmt ELSE { printf("Estructura if/else válida\n"); }
                  ;

stmt              : DECLARATION ';'
                  | ASSIGNMENT ';'
                  | '{' line '}'
                  ;

VARIABLE          : TERM    {;}
                  | VARIABLE TERM {;}
                  ;

TERM              : number      {;}
                  | IDENTIFIER  {;}
                  ;

EXPRESSION        : EXPRESSION RELATIONAL_OP EXPRESSION
                  | EXPRESSION LOGICAL_OP EXPRESSION
                  | '(' EXPRESSION ')'
                  | VARIABLE
                  | TRUE
                  | FALSE
                  ;

RELATIONAL_OP     : EQUAL
                  | DIFFERENT
                  | LESS_EQUAL
                  | GREATER_EQUAL
                  | '>'
                  | '<'
                  ;

LOGICAL_OP        : AND
                  | OR
                  ;
%%

int main (void) {
  printf("Escribe expresiones del lenguaje C en una sola línea\n");
  int value = yyparse();
  return value;
}

void yyerror (char *s) {
  printf("Instrucción inválida para el lenguaje\n");
  printf("Saliendo...\n");
}