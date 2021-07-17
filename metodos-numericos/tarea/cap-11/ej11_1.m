clc;
clear;
close all;

matriz = [
  0.8   -0.4  0   
  -0.4  0.8   -0.4  
  0     -0.4  0.8
];

results = [41 25 105];

[T] = thomas(matriz, results);

for i = T
  fprintf('Resultado: %.3f\n', i);
end
