clear;
close all;
clc;

matriz = [
  2.01475     -0.020875   0           0
  -0.020875   2.01475     -0.020875   0
  0           -0.020875   2.01475     -0.020875
  0           0           -0.020875   2.01475
];

results = [4.175 0 0 2.0875];

[X] = thomas(matriz, results);


for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end