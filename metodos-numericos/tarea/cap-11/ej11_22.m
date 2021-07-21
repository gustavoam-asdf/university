clear;
close all;
clc;

matriz = input('Ingrese una matriz A compatible con el método de Cholesky:\n');

results = input('Ingrese el vector b del sistema:\n');

[~, X] = descomChol(matriz, results);


for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end