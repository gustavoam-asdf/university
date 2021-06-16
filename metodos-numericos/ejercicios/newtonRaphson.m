clear;
close all;
clc;

syms x

f = input('Ingrese la función: ');
xi(1) = input('Aproximación inicial: ');
errTol= input('Error tolerado: ');

fprintf("Iteraciones: \n");

df = diff(f);
fplot(f);
hold on;
fplot(df);

err = 100;
i = 1;
fprintf('%3s   %-9s %-9s %-9s %-9s\n','it.','xi','f(x)', 'xi+1', 'Error');
while (errTol < err)
 fxi = subs(f, x, xi(i));
 dfxi = subs(df, x, xi(i));
 xi(i+1) = xi(i) - (fxi/dfxi);
 err = abs((xi(i+1)-xi(i)) / xi(i+1));
 fprintf('%3d %9.5f %9.5f %9.5f %9.5f\n',i,xi(i),fxi, xi(i+1), err);
 
 i = i+1;
end