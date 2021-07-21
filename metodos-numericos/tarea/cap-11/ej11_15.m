clc;
clear;
close all;
format long;

% a)
matriz = [
  1   4   9
  4   9   16
  9   16  25
];

results = [14 29 50];

[~, ~, X] = descomLU(matriz, results);

fprintf('Resultados para el inciso a:\n');
for i = 1: length(X)
  fprintf('x%d = %f\n', i, X(i));
end

% b)

matriz = [
  1   4   9   16
  4   9   16  25
  9   16  25  36
  16  25  36  49
];

results = [30 54 86 126];

X = zeros(length(matriz), 1);

[~, ~, X] = descomLU(matriz, results);

fprintf('\nResultados del inciso b:\n\n');
for i = 1: length(X)
  fprintf('x%d = %f\n', i, round(X(i), 0));
end
