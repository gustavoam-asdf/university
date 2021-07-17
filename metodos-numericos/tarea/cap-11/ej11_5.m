clear;
close all;
clc;

matriz = [
  8   20  15
  20  80  50
  15  50  60
];

results = [50 250 100];

[L, X] = descomChol(matriz, results);

for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end