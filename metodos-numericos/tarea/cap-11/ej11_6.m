clear;
close all;
clc;

matriz = [
  6     15    55
  15    55    225
  55    225   979
];

results = [152.6 585.6 2488.8];

[L, a] = descomChol(matriz, results);

for i = 1: length(a)
  fprintf('a%d = %.3f\n', i-1, a(i));
end