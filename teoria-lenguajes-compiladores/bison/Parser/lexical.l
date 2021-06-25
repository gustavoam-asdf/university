%{

  #include "y.tab.h"
  void yyerror (char *s);
  int yylex ();
%}

%%

"while"               {return (WHILE);}
"if"                  {return (IF);}
"else"                {return (ELSE);}
"int"                 {return type;}                         
"String"              {return type;}                             
"printf"              {return print;}
"TRUE"                {return (TRUE);}
"FALSE"               {return (FALSE);}
\"                    {return (COMILLAS);}
","                   {;}
"&&"                  {return (AND);}
"||"                  {return (OR);}
"<="                  {return (LESS_EQUAL);}
">="                  {return (GREATER_EQUAL);}
"=="                  {return (EQUAL);}
"!="                  {return (DIFFERENT);}
"<"                   {return ('<');}
">"                   {return ('>');}
"("                   {return ('(');}
")"                   {return (')');}
"{"                   {return ('{');}
"}"                   {return ('}');}
[0-9]+                {return number;}
[a-zA-Z0-9_]+         {return IDENTIFIER;}
"++"                  {return INCREMENT;}
"--"                  {return DECREMENT;}
[=;]                  {return yytext[0];}
[ \t\n\s\r\f]         {;}
.                     {ECHO; yyerror ("Error: Caracter no válido"); }

%%
int yywrap (void) {return 1;}