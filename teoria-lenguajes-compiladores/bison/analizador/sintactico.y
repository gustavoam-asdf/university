%{
int yystopparser = 0;
%}

%token MAIN NOMBRECAMPO ENTERO DECIMAL BOLEANO CADENA ITGR DOU T_F TEXT ASIGNADOR SUMA RESTA MULTIPLICACION DIVISION AUMENTAR DISMINUIR MAYOR MENOR IGUAL MAYORIGUAL MENORIGUAL DIFERENTE IF ELSE IFELSE FOR WHILE


%start begin

%%

begin       			  : principal funciones | principal;
principal       		: MAIN '(' ')' '{' lineascodigos '}';
lineascodigos       : lineacodigo | ;
lineacodigo       	: lineacodigo linea | linea;
linea       			  :	invocarmetodo ';' | crearvariable ';' | cambiarvalor ';' | ciclocondicion;
invocarmetodo       : NOMBRECAMPO '(' parametrosenvio ')';
parametrosenvio     : parenvio | ;
parenvio        		: parenvio ',' penvio | penvio;
penvio        			:	valor | NOMBRECAMPO;
valor       			  :	ENTERO | DECIMAL | BOLEANO | CADENA; 
crearvariable       : tipodato NOMBRECAMPO | tipodato NOMBRECAMPO asignarvalor;
tipodato        		: ITGR | DOU | T_F | TEXT;
asignarvalor        : ASIGNADOR operasignacion | ASIGNADOR valor | ASIGNADOR NOMBRECAMPO;
operasignacion      : aritmetica | invocarmetodo | incredisminvariable;
aritmetica        	: oprcomun | oprcomun oprcomplemento;
oprcomun        		: valor tipoopr valor | valor tipoopr NOMBRECAMPO | NOMBRECAMPO tipoopr valor | NOMBRECAMPO tipoopr NOMBRECAMPO;
tipoopr       			:	SUMA | RESTA | MULTIPLICACION | DIVISION;
oprcomplemento      : oprcomplemento oprcom | oprcom;
oprcom        			:	tipoopr valor | tipoopr NOMBRECAMPO;
incredisminvariable :	NOMBRECAMPO indis;
indis       			  :	AUMENTAR | DISMINUIR;
cambiarvalor        : NOMBRECAMPO ASIGNADOR cambvalor;
cambvalor       		: valor | operasignacion | NOMBRECAMPO;
ciclocondicion      : ifcondicion | ciclofor | ciclowhile;
ifcondicion       	: condicionsi | condicionsi condicionno | condicionsi condicionessino condicionno;
condicionsi       	: IF '(' condicion ')' '{' lineascodigos '}'
condicion       		: valor condicional valor | valor condicional NOMBRECAMPO | NOMBRECAMPO condicional valor | NOMBRECAMPO condicional NOMBRECAMPO;
condicional       	: MAYOR | MENOR | IGUAL | MAYORIGUAL | MENORIGUAL | DIFERENTE;
condicionno		      :	ELSE '{' lineascodigos '}';
condicionessino		  :	condicionessino condicionsino | condicionsino;
condicionsino		    :	IFELSE '(' condicion ')' '{' lineascodigos '}';
ciclofor		        :	FOR '(' iniciafor ';' condicion ';' incredisminvariable ')' '{' lineascodigos '}';
iniciafor		        :	tipodato NOMBRECAMPO asignarvalor;
ciclowhile		      :	WHILE '(' condicion ')' '{' lineascodigos '}';
funciones		        :	funciones funcion | funcion;
funcion			        :	tiporetorno NOMBRECAMPO '(' parametrosentrada ')' '{' lineascodigos '}';
tiporetorno		      :	tipodato;
parametrosentrada	  :	parametros;
parametros	        :	parametros ',' parametro | parametro;
parametro		        :	tipodato NOMBRECAMPO;