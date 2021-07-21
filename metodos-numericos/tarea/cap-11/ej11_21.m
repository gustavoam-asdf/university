clc;
clear;
close all;

matriz = input('Ingrese una matriz A compatible con el método de thomas:\n');

results = input('Ingrese un vector b:\n');

[X] = thomas(matriz, results);

for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end
