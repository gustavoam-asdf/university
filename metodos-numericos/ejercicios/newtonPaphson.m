%METODO DE NEWTON RAPHSON
clc;
syms x
disp(' M E T O D O D E N E W T O N - R A P H S O N');
disp('-----------------------------------------------------------');
disp('Datos de entrada');
f = input('Función :','s');
ezplot(f,[-2,2]);
x0 = input('Aproximación inicial :');
tol= input('Tolerancia :');
disp('Datos de salida')
df = diff(sym(f));
f = inline(char(f));
df = inline(df);
x = x0;
e = abs(f(x));
i = 0;
fprintf('%s\t\t\t%s\t%s\n','it.','x','f(x)');
while (e>=tol)
 fprintf('%d\t%7.11f\t%7.11f\n',i,x,f(x))
 nwr = x - (f(x)/df(x));
 e = abs(f(x));
 x = nwr;
 i = i+1;
end