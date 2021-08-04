clc;
clear;

matriz = [
  10    2     -1
  -3    -6    -2
  1     1     5
];


results = [27 -61.5 -21.5];

[~, ~, X] = descomLU(matriz, results);

fprintf('Resultados:\n')
for i = 1:length(X)
  fprintf('x%d: %f\n',i, X(i))
end
fprintf('\n')

fprintf('Verificar que [A][A]–1 = [I].\n');
disp('Matriz');
disp(matriz);
disp('Matriz inversa');
disp(inv(matriz));

disp('Matriz identidad')
disp(eye(length(matriz)));

disp('[A]inv([A])')
disp(matriz*inv(matriz));