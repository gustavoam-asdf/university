clc;
clear;
close all;

%matriz = [
%  -3    1     -12
%  6     -1    -1
%  6     9     1
%];

%results = [50 3 40];

% Para asegurar la convergencia el valor absoluto del coeficiente de la 
% diagonal de cada ecuacion debe ser mayor que la suma del valor absoluto 
% de los otros coeficientes

matriz = [
  6     -1    -1
  6     9     1
  -3    1     -12
];

results = [3 40 50];

errTol = 0.05;
X = [0 0 0]';
maxIter = 20;

% a) Sin relajación
[X] = gaussSeidel(matriz, results, X, errTol, maxIter);

fprintf('Gauss Seidel sin relajación\n');
for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end

% b) Con relajación
X = [0 0 0]';
relajacion = 0.95;
[X] = gaussSeidelRel(matriz, results, X, maxIter, errTol, relajacion);

fprintf('Con Gauss Seidel con Relajacion\n');
for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end