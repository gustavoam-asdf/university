clc;
clear;
close all;

maxIter = 10;
errTol = 0.05;

% Primer sistema
matriz = [
  9     3     1
  -6    0     8
  2     5     -1
];

% No va a converger debido a que en la 2da y 3ra ecuación el coeficiente
% que es su diagonal, en este caso 0 y -1 respectivamente, son menores que
% la suma del valor absoluto de los otros coeficientes.
% Se puede solucionar intercambiando de posiciín la 2da y 3ra ecuación

results = [13 2 6];

X = zeros(length(matriz), 1);

[X, H, converge] = gaussSeidel(matriz, results, X, errTol, maxIter);

fprintf('Resultados del primer sistema de ecuaciones:\n');
for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end

ejeX1 = H(:,1)';
ejeX2 = H(:,2)';
ejeX3 = H(:,3)';

x1 = ejeX1';
x2 = ejeX2';
x3 = ejeX3';
T = table(x1,x2,x3);
disp(T);

if converge
  fprintf('El sistema converge\n\n');
else
  fprintf('El sistema no converge\n\n');
end

% Segundo sistema

matriz = [
  1     1     6
  4     2     -2
  1     5     -1
];

% No va a converger debido a que en la 1ra y 3ra ecuación el coeficiente
% que es su diagonal, en este caso 1 y -2 respectivamente, son menores que
% la suma del valor absoluto de los otros coeficientes.
% Se puede solucionar intercambiado la 1ra y 3ra ecuación.

results = [8 5 4];

X = zeros(length(matriz), 1);

[X, H, converge] = gaussSeidel(matriz, results, X, errTol, maxIter);

fprintf('\nResultados del segundo sistema de ecuaciones:\n\n');
for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end

ejeX1 = H(:,1)';
ejeX2 = H(:,2)';
ejeX3 = H(:,3)';

x1 = ejeX1';
x2 = ejeX2';
x3 = ejeX3';
T = table(x1,x2,x3);
disp(T);

if converge
  fprintf('El sistema converge\n\n');
else
  fprintf('El sistema no converge\n\n');
end

% Tercer sistema

matriz = [
  -3    4    5
  -2    2    -3
  0     2    -1
];

% No va a converger debido a que en la 2da y 3ra ecuación el coeficiente
% que es su diagonal, en este caso 2 y -1 respectivamente, son menores que
% la suma del valor absoluto de los otros coeficientes
% No se puede solucionar debido a que el primer coeficiente de la diagonal
% nunca es mayor que la suma del valor absoluto de los otros 2 

results = [6 -3 1];

X = zeros(length(matriz), 1);

[X, H, converge] = gaussSeidel(matriz, results, X, errTol, maxIter);

fprintf('\nResultados del tercer sistema de ecuaciones:\n\n');
for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end

ejeX1 = H(:,1)';
ejeX2 = H(:,2)';
ejeX3 = H(:,3)';

x1 = ejeX1';
x2 = ejeX2';
x3 = ejeX3';
T = table(x1,x2,x3);
disp(T);

if converge
  fprintf('El sistema converge\n\n');
else
  fprintf('El sistema no converge\n\n');
end
