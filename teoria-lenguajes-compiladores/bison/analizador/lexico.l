%{
#include <stdio.h>
#include "./analizadorSintactico.h"
%}

%option noyywrap
%option yylineno

ignore    " "|\t|\n
caracter  [A-Za-z]
digito    [0-9]
boleano   "true"|"false"

%%

{ignore}				                    {;}     
"."					                        {return ('.');}
"{"					                        {return ('{');}
"}"					                        {return ('}');}
";"					                        {return (';');}
","					                        {return (',');}
"("					                        {return ('(');}
")"					                        {return (')');}
"["					                        {return ('[');}
"]"					                        {return (']');}
"si"					                      {return IF;}
"otra_condi"		                    {return IFELSE;}
"sino"					                    {return ELSE;}
"main"					                    {return MAIN;}
"integer"				                    {return ITGR;}
"decimal"				                    {return DOU;}
"bool"					                    {return T_F;}
"text"					                    {return TEXT;}
"para"					                    {return FOR;}
"mientras"			                    {return WHILE;}
"+"					                        {return SUMA;}
"-"					                        {return RESTA;}
"*"					                        {return MULTIPLICACION;}
"/"					                        {return DIVISION;}
"++"					                      {return AUMENTAR;}
"--"					                      {return DISMINUIR;}
":="					                      {return ASIGNADOR;}
">"					                        {return MAYOR;}
"<"					                        {return MENOR;}
"=="					                      {return IGUAL;}
">="					                      {return MAYORIGUAL;}
"<="					                      {return MENORIGUAL;}
"<>"					                      {return DIFERENTE;}
{digito}+				                    {return ENTERO;}
{digito}+"."{digito}		            {return DECIMAL;}
{boleano}				                    {return BOLEANO;}
"\""({digito}|{caracter}|" ")*"\""	{return CADENA;}
{caracter}({caracter}|(digito))*	  {return NOMBRECAMPO;}
.					                          {printf("ERROR EN LA LINEA: %d\n",yylineno);}

%%

int yyerror(char *msg) {
  printf("%s\n", msg);
  return 1;
}

int main(int argc, char *argv[]) {
  yyin = fopen(argv[1], "rt");
  if(yyin == NULL)
    printf("\nNo se puede leer el archivo");
  else
    yylex();
  
  fclose(yyin);
}