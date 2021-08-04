clc;
clear;

matriz = [
  2     -6    -1
  -3    -1    7
  -8    1     -2
];

results = [-38 -34 -20];

[~, ~, X] = descomLU(matriz, results);

fprintf('Resultados:\n')
for i = 1:length(X)
  fprintf('x%d: %f\n',i, X(i))
end
fprintf('\n')
