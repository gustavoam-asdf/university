clc;
clear;
close all;

matriz = [
  1    -1
  1   1
];

results = [286 99];

errTol = 0.05;
X = zeros(length(matriz), 1);
maxIter = 10;

[X, H] = gaussSeidel(matriz, results, X, errTol, maxIter);

for i = 1: length(X)
  fprintf('x%d = %.3f\n\n', i, X(i));
end
ejeX1 = H(:,1)';
ejeX2 = H(:,2)';

x1 = ejeX1';
x2 = ejeX2';
T = table(x1,x2);
disp(T);

hold on
grid
for i = 2 : length(H)
  plot(ejeX1(i),ejeX2(i), 'r*')
  pause
end