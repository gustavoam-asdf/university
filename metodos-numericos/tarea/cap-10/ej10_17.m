clc;
clear;

matriz = [
  2   5   1
  6   2   1
  1   2   1
];


results = [-5 12 3];

X = [2 -3 8]';
errTol = 0.0001;
maxIter = 20;

[X] = gaussSeidel(matriz, results, X, errTol, maxIter);

fprintf('Resultados:\n')
for i = 1:length(X)
  fprintf('x%d: %f\n',i, X(i))
end