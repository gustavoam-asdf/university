clear;
close all;
clc;

% [A] = [L][L'] ....................ecuacion 11.2

% Ejemplo 11.2
matriz = [
  6     15    55
  15    55    225
  55    225   979
];

results = [0 0 0];

[L] = descomChol(matriz, results);

verificar = L * L';

fprintf('Matriz original\n');
disp(matriz);
fprintf('Matriz creada\n');
disp(verificar);