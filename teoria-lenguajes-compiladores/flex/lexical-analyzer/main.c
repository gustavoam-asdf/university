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
  else if (sonStringsIguales(lexema, "-"))
    valor = 2;
  else if (sonStringsIguales(lexema, "%"))
    valor = 3;
  else if (sonStringsIguales(lexema, "/"))
    valor = 4;
  else
    printf("Error");

  return crearSimbolo(lexema, OP_ARITMETICO, "O. aritmético", valor);
}

void mostrarSimbolo(struct Simbolo *simbolo)
{
  printf("%s\t%d (%s)\t%d\n", simbolo->lexema, simbolo->clase, simbolo->nombreClase, simbolo->valor);
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

int main(int argc, char *argv[])
{
  struct Nodo *cursor = NULL;

  insertarFinal(&cursor, crearSimboloIdentificador("main"));
  insertarFinal(&cursor, crearSimboloIdentificador("int"));
  insertarFinal(&cursor, crearSimboloConstEntera("40"));
  insertarFinal(&cursor, crearSimboloOperadorAsignacion("+="));
  insertarFinal(&cursor, crearSimboloOperadorAritmetico("+"));
  insertarFinal(&cursor, crearSimboloIdentificador("const"));

  printf("Lexema\tClase\t\t\tValor\n");
  imprimirLista(cursor);
}