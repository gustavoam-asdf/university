clc;
clear;

matriz = [
  2     -6    1
  -1    7     -1
  1     -3    2
];

results = [12 -8 16];

[L, U, X] = crout(matriz, results);

fprintf('Resultados:\n')
for i = 1:length(X)
  fprintf('x%d: %f\n',i, X(i))
end
fprintf('\n')

disp('Matriz original');
disp(matriz);
disp('[L][U] = [A]');
disp(L*U);