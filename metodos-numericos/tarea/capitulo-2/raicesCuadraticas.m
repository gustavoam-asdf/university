clc;

a = input('Ingrese el valor para a: ');
b = input('Ingrese el valor para b: ');
c = input('Ingrese el valor para b: ');

coefs = [a b c];

raices = roots(coefs);

disp('Las raíces son: ');
disp(raices);