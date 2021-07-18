clc;
clear;
close all;

matriz = [
  15    -3    -1
  -3    18    -6
  -4    -1    12
];

results = [3800 1200 2350];

errTol = 0.05;
X = [0 0 0]';
maxIter = 20;

[X] = jacobi(matriz, results, X, errTol, maxIter);

for i = 1: length(X)
  fprintf('c%d = %.3f\n', i, X(i));
end