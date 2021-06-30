close all;
clear;
clc;

matriz = [6 15 55; 15 55 225; 55 225 979];
n = length(matriz);
L = zeros(n);

for i = 1:n
  L(i,i) = sqrt( matriz(i,i) - L(i,:) * L(i,:)' );
  for k = (i+1):n
    L(k,i) = ( matriz(k,i) - L(i,:) * L(k,:)' ) / L(i,i);
  end
end

fprintf('Descomposición Cholesky:\n')
disp(L);
fprintf('Verificación:\n')
disp(L*L');