clear;
close all;
clc;

matriz = [
  0.8   -0.4  0   
  -0.4  0.8   -0.4  
  0     -0.4  0.8
];

results = [41 25 105];

[L, U, X] = descomLU(matriz, results);


for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end