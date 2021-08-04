clc;
clear;

matriz = [
  8     4     -1
  -2    5     1
  2     -1    6
];


results = [11 4 7];

% a)

[~, ~, X] = descomLU(matriz, results);

fprintf('a) Resultados:\n')
for i = 1:length(X)
  fprintf('x%d: %f\n',i, X(i))
end
fprintf('\n')

fprintf('b) Determine la matriz inversa. Compruebe sus resultados por \nmedio de verificar que [A][A]–1 = [I].\n');
disp('Matriz');
disp(matriz);
disp('Matriz inversa');
disp(inv(matriz));

disp('Matriz identidad')
disp(eye(length(matriz)));

disp('[A]inv([A])')
disp(matriz*inv(matriz));