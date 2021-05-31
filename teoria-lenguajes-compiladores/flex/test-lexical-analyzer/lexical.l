%{

  #include <stdio.h>
  #include <stdlib.h>
  #include <stdbool.h>
  #include <strings.h>

  #define CONST_ENTERA 0
  #define IDENTIFICADOR 1
  #define OP_ARITMETICO 2
  #define OP_ASIGNACION 3

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

  struct Simbolo *crearSimbolo(char* lexema, int clase, char *nombreClase, int valor)
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
    return crearSimbolo(lexema, OP_ASIGNACION, "O. asignacion", valor);
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

    return crearSimbolo(lexema, OP_ARITMETICO, "O. aritmetico", valor);
  }

  void mostrarSimbolo(struct Simbolo *simbolo)
  {
    printf("%-20s|%-20s|%3d|%8d\n", simbolo->lexema, simbolo->nombreClase, simbolo->clase, simbolo->valor);
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

identificador         ({letra}(_|{digito})*)+
constEntera           (-?[1-9]{digito}*)|0
constFlotante         {constEntera}{charPunto}{digito}+
constCadena           \"[^\n"]*\"

opSuma                ["+"]
opResta               [\-]
opMod                 [\%]
opDiv                 ["/"]

opIgual               ["="]
opMasIgual            (\+\=)
opMenosIgual          (\-\=)
opMultIgual           (\*\=)
opDivIgual            (\/\=)
opModIgual            (\%\=)
opOrIgual             (\|\=)
opAndIgual            (\&\=)
opRightShiftIgual     (\>{2}\=)
opLeftShiftIgual      (\<{2}\=)
opExpIgual            (\^\=)

opMayor               [">"]
opMenor               ["<"]
opMayorIgual          ">="
opMenorIgual          "<="
opComparadorIgual     "=="
opNegacion            "!"
opDistinto            "!="

llaveApertura         ["{"]
llaveCierre           ["}"]
parentesisApertura    ["("]
parentesisCierre      [")"]
finSentencia          {charPuntoYComa}

opAsignacion          {opIgual}|{opMasIgual}|{opMenosIgual}|{opMultIgual}|{opDivIgual}|{opModIgual}|{opOrIgual}|{opAndIgual}|{opRightShiftIgual}|{opLeftShiftIgual}|{opExpIgual}
opAritmetico          {opSuma}|{opResta}|{opMod}|{opDiv}

%%

{finSentencia}        {printf("\n finSentencia       : %s", yytext);}
{charComa}            {printf("\n charComa           : %s", yytext);}
{constFlotante}       {printf("\n constFlotante      : %s", yytext);}
{constCadena}         {printf("\n constCadena        : %s", yytext);}


{opMayor}             {printf("\n opMayor            : %s", yytext);}
{opMenor}             {printf("\n opMenor            : %s", yytext);}
{opMayorIgual}        {printf("\n opMayorIgual       : %s", yytext);}
{opMenorIgual}        {printf("\n opMenorIgual       : %s", yytext);}
{opComparadorIgual}   {printf("\n opComparadorIgual  : %s", yytext);}
{opNegacion}          {printf("\n opNegacion         : %s", yytext);}
{opDistinto}          {printf("\n opDistinto         : %s", yytext);}

{llaveApertura}       {printf("\n llaveApertura      : %s", yytext);}
{llaveCierre}         {printf("\n llaveCierre        : %s", yytext);}
{parentesisApertura}  {printf("\n parentesisApertura : %s", yytext);}
{parentesisCierre}    {printf("\n parentesisCierre   : %s", yytext);}

{opAsignacion}        {insertarFinal(&cursor, crearSimboloOperadorAsignacion(strdup(yytext)));}

{opAritmetico}        {insertarFinal(&cursor, crearSimboloOperadorAritmetico(strdup(yytext)));}

{constEntera}         {insertarFinal(&cursor, crearSimboloConstEntera(strdup(yytext)));}

{identificador}       {insertarFinal(&cursor, crearSimboloIdentificador(strdup(yytext)));}

[ \r\t\n]+            {}
.                     {insertarFinal(&cursor, crearSimbolo(strdup(yytext), 9, "Error", 9));}

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

  printf("======================================================\n");
  printf("Lexema\t\t\tClase\t\t  N° \tValor\n");
  printf("======================================================\n");
  imprimirLista(cursor);
  printf("======================================================\n");
  exit(0);
}

int yyerror(void) {
  printf("\nError lexico: Caracter invalido: (%s), saliendo...\n", yytext);
  exit(1);
}