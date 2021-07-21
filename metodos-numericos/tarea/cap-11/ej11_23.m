clear;
close all;
clc;

matriz = input('Ingrese una matriz A compatible con el método de Gauss-Seidel:\n');

results = input('Ingrese el vector b del sistema:\n');
errTol = input('Error tolerado: ');
X = input('Ingrese el vector de posiciones iniciales: ');
X = X';
maxIter = input('Ingrese el número de iteraciones: ');

[X] = gaussSeidel(matriz, results, X, errTol, maxIter);

fprintf('Resultados: \n');
for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end