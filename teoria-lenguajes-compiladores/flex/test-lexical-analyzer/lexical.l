%{

  #include <stdio.h>
  #include <stdlib.h>
  #include <stdbool.h>
  #include <strings.h>

  #define CONST_ENTERA 0
  #define IDENTIFICADOR 1
  #define OP_ARITMETICO 2
  #define OP_ASIGNACION 3

  FILE *yyin;
  struct Nodo *cursor = NULL;
%}

%option noyywrap
%option yylineno

digito                [0-9]
letra                 [a-zA-Z]
espacio               [" "]
inicioComentario      ["/*"]
finComentario         ["*/"]
guiones               [-_]
charComa              [","]
charPunto             ["."]
charPuntoYComa        [";"]
charDosPuntos         [":"]

identificador         {letra}({letra}|{digito}{guiones})*
constEntera           (-?[1-9][0-9]*)|0
constFlotante         {constEntera}{charPunto}{digito}+
constCadena           \"[^\n"]*\"

opSuma                ["+"]
opResta               [\-]
opMult                [\*]
opDiv                 ["/"]
opIgual               ["="]
opMayor               [">"]
opMenor               ["<"]
opMayorIgual          ">="
opMenorIgual          "<="
opComparadorIgual     "=="
opNegacion            "!"
opDistinto            "!="
opDosPuntos           {charDosPuntos}

llaveApertura         ["{"]
llaveCierre           ["}"]
parentesisApertura    ["("]
parentesisCierre      [")"]
finSentencia          {charPuntoYComa}

if                    "if"|"IF"
while                 "while"|"WHILE"
decVar                "DECVAR"
endDec                "ENDDEC"
integer               "integer"|"INTEGER"
float                 "float"|"FLOAT"
write                 "write"|"WRITE"

%%

{finSentencia}        {printf("\n finSentencia (%s)", yytext);}
{charComa}            {printf("\n charComa (%s)", yytext);}
{constEntera}         {printf("\n constEntera (%s)", yytext);}
{constFlotante}       {printf("\n constFlotante (%s)", yytext);}
{constCadena}         {printf("\n constCadena (%s)", yytext);}

{opSuma}              {printf("\n opSuma (%s)", yytext);}
{opResta}             {printf("\n opResta (%s)", yytext);}
{opMult}              {printf("\n opMult (%s)", yytext);}
{opDiv}               {printf("\n opDiv (%s)", yytext);}
{opIgual}             {printf("\n opIgual (%s)", yytext);}
{opMayor}             {printf("\n opMayor (%s)", yytext);}
{opMenor}             {printf("\n opMenor (%s)", yytext);}
{opMayorIgual}        {printf("\n opMayorIgual (%s)", yytext);}
{opMenorIgual}        {printf("\n opMenorIgual (%s)", yytext);}
{opComparadorIgual}   {printf("\n opComparadorIgual (%s)", yytext);}
{opNegacion}          {printf("\n opNegacion (%s)", yytext);}
{opDistinto}          {printf("\n opDistinto (%s)", yytext);}
{opDosPuntos}         {printf("\n opDosPuntos (%s)", yytext);}

{llaveApertura}       {printf("\n llaveApertura (%s)", yytext);}
{llaveCierre}         {printf("\n llaveCierre (%s)", yytext);}
{parentesisApertura}  {printf("\n parentesisApertura (%s)", yytext);}
{parentesisCierre}    {printf("\n parentesisCierre (%s)", yytext);}

{if}                  {printf("\n if (%s)", yytext);}
{while}               {printf("\n while (%s)", yytext);}
{decVar}              {printf("\n decVar (%s)", yytext);}
{endDec}              {printf("\n endDec (%s)", yytext);}
{integer}             {printf("\n integer (%s)", yytext);}
{float}               {printf("\n float (%s)", yytext);}
{write}               {printf("\n write (%s)", yytext);}

{identificador}       {printf("\n identificador (%s)", yytext);}

[ \r\t\n]+          {}
.                     {printf("\n Error");}

%%

int main (int argc, char *argv[]) {
  yyin = fopen(argv[1], "rt");
  if (yyin == NULL) {
    printf("Error al leer el archivo: %s\n", argv[1]);
    exit(1);
  }

  yylex();

  printf("\n Finalizo la lectura del archivo %s \n", argv[1]);
  fclose(yyin);
  exit(0);
}

int yyerror(void) {
  printf("\nError lexico: Caracter invalido: (%s), saliendo...\n", yytext);
  exit(1);
}

bool sonStringsIguales(char *firstWord, char *secondWord)
{
  return strcasecmp(firstWord, secondWord) == 0 ? true : false;
}

struct Simbolo
{
  char *lexema;
  int clase;
  char *nombreClase;
  int valor;
} Simbolo;

struct Simbolo *crearSimbolo(char *lexema, int clase, char *nombreClase, int valor)
{
  struct Simbolo *nuevoSimbolo = malloc(sizeof(struct Simbolo));
  nuevoSimbolo->lexema = lexema;
  nuevoSimbolo->clase = clase;
  nuevoSimbolo->nombreClase = nombreClase;
  nuevoSimbolo->valor = valor;
  return nuevoSimbolo;
}

struct Simbolo *crearSimboloConstEntera(char *lexema)
{
  return crearSimbolo(lexema, CONST_ENTERA, "Constante Entera", atoi(lexema));
}

int cIdentificador = 0;
struct Simbolo *crearSimboloIdentificador(char *lexema)
{
  return crearSimbolo(lexema, IDENTIFICADOR, "Identificador", ++cIdentificador);
}

struct Simbolo *crearSimboloOperadorAsignacion(char *lexema)
{
  int valor;
  if (sonStringsIguales(lexema, "="))
    valor = 0;
  else if (sonStringsIguales(lexema, "+="))
    valor = 1;
  else if (sonStringsIguales(lexema, "-="))
    valor = 2;
  else if (sonStringsIguales(lexema, "*="))
    valor = 3;
  else if (sonStringsIguales(lexema, "/="))
    valor = 4;
  else if (sonStringsIguales(lexema, "%="))
    valor = 5;
  else if (sonStringsIguales(lexema, "|="))
    valor = 6;
  else if (sonStringsIguales(lexema, "&="))
    valor = 7;
  else if (sonStringsIguales(lexema, ">>="))
    valor = 8;
  else if (sonStringsIguales(lexema, "<<="))
    valor = 9;
  else if (sonStringsIguales(lexema, "^="))
    valor = 10;
  else
    printf("Error");
  return crearSimbolo(lexema, OP_ASIGNACION, "O. asignación", valor);
}

struct Simbolo *crearSimboloOperadorAritmetico(char *lexema)
{
  int valor;
  if (sonStringsIguales(lexema, "+"))
    valor = 0;
  else if (sonStringsIguales(lexema, "-"))
    valor = 1;
  else if (sonStringsIguales(lexema, "%"))
    valor = 2;
  else if (sonStringsIguales(lexema, "/"))
    valor = 3;
  else
    printf("Error");

  return crearSimbolo(lexema, OP_ARITMETICO, "O. aritmético", valor);
}

void mostrarSimbolo(struct Simbolo *simbolo)
{
  printf("==================================\n");
  printf("%s  %d  %d\n", simbolo->lexema, simbolo->clase, simbolo->valor);
  printf("==================================\n");
}

struct Nodo
{
  struct Nodo *anterior;
  struct Simbolo *simbolo;
  struct Nodo *siguiente;
} Nodo;

struct Nodo *crearNodo(struct Simbolo *simbolo)
{
  struct Nodo *nuevoNodo = malloc(sizeof(struct Nodo));
  nuevoNodo->simbolo = simbolo;
  nuevoNodo->anterior = NULL;
  nuevoNodo->siguiente = NULL;
  return nuevoNodo;
}

bool insertarInicio(struct Nodo **cursor, struct Simbolo *simbolo)
{
  struct Nodo *nuevoNodo = crearNodo(simbolo);
  if (nuevoNodo != NULL)
  {
    nuevoNodo->siguiente = *cursor;
    nuevoNodo->anterior = NULL;
    if (*cursor != NULL)
    {
      (*cursor)->anterior = nuevoNodo;
    }
    *cursor = nuevoNodo;
    return true;
  }
  return false;
}

bool insertarFinal(struct Nodo **cursor, struct Simbolo *simbolo)
{
  if (*cursor == NULL)
  {
    insertarInicio(cursor, simbolo);
    return true;
  }
  struct Nodo *nuevoNodo = crearNodo(simbolo);
  struct Nodo *aux = *cursor;
  if (nuevoNodo == NULL)
  {
    printf("Error");
    return false;
  }
  while (aux->siguiente != NULL)
  {
    aux = aux->siguiente;
  }
  nuevoNodo->anterior = aux;
  aux->siguiente = nuevoNodo;
  return true;
}

void imprimirLista(struct Nodo *cursor)
{
  struct Nodo *aux = cursor;

  while (aux != NULL)
  {
    mostrarSimbolo(aux->simbolo);
    aux = aux->siguiente;
  }
}