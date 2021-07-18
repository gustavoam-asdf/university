clc;
clear;
close all;

matriz = [
  10    2     -1
  -3    -6    2
  1     1     5
];

results = [27 -61.5 -21.5];

errTol = 0.05;
X = [0 0 0]';
maxIter = 20;

[X] = gaussSeidel(matriz, results, X, errTol, maxIter);

for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end