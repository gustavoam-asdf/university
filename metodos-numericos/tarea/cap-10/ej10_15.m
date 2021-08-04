clc;
clear;

matriz = input('Ingrese la matriz A: ');
results = input('Ingrese el vector b: ');

[L, U, X] = descomLU(matriz, results);

disp('[L]')
disp(L)
disp('[U]')
disp(U)
disp('[L][U]')
disp(L*U)

fprintf('Resultados:\n')
for i = 1:length(X)
  fprintf('x%d: %f\n',i, X(i))
end
fprintf('\n')