clc;
clear;

matriz = [
  10    2     -1
  -3    -6    2
  1     1     -5
];


results = [27 -61.5 -21.5];

% a)

fprintf('a) Eliminación simple de Gauss\n');

[L, U] = descomGauss(matriz, results);

fprintf('Matriz:\n');
disp(matriz);
fprintf('L * U:\n');
disp(L*U);

% b)

fprintf('b) Con descomposición LU\n');

[~, ~, X] = descomLU(matriz, results);

for i = 1:length(X)
  fprintf('x%d: %f\n',i, X(i))
end
fprintf('\n')

% c)

fprintf('c) Resolucion para un vector B = [12 16 -6]\n');

B = [12 16 -6];

[~, ~, X] = descomGauss(matriz, B);

for i = 1:length(X)
  fprintf('x%d: %f\n',i, X(i))
end