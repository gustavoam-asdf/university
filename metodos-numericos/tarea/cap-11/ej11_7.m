clc;
clear;
close all;

matriz = [
  0.8   -0.4  0   
  -0.4  0.8   -0.4  
  0     -0.4  0.8
];

results = [41 25 105];

errTol = 0.05;
X = [0 0 0]';
maxIter = 100;

% a)
[X] = gaussSeidel(matriz, results, X, errTol, maxIter);

fprintf('Con Gauss Seidel\n');
for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end

% b)
X = [0 0 0]';
relajacion = 1.2;
[X] = gaussSeidelRel(matriz, results, X, maxIter, errTol, relajacion);

fprintf('Con Gauss Seidel con Relajacion\n');
for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end