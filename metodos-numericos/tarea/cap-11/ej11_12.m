clc;
clear;
close all;

%matriz = [
%  2     -6    -1
%  -3    -1    7
%  -8    1     -2
%];

%results = [-38 -34 -20];

% Para asegurar la convergencia el valor absoluto del coeficiente de la 
% diagonal de cada ecuacion debe ser mayor que la suma del valor absoluto 
% de los otros coeficientes

matriz = [
  -8    1     -2
  2     -6    -1
  -3    -1    7
];

results = [-20 -38 -34];

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
relajacion = 1.2;
[X] = gaussSeidelRel(matriz, results, X, maxIter, errTol, relajacion);

fprintf('Con Gauss Seidel con Relajacion\n');
for i = 1: length(X)
  fprintf('x%d = %.3f\n', i, X(i));
end