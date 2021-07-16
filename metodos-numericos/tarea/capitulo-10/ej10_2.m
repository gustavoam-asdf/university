clc;
clear;
syms x1 x2 x3
ec1 = [10 2 -1];
ec2 = [-3 -6 2];
ec3 = [1 1 -5];
coefs = [27 ; -61.5 ; -21.5];
matriz = [ec1;ec2;ec3];

% a)

[L, U, R] = descomGauss(matriz, coefs);

fprintf('Matriz:\n');
disp(matriz);
fprintf('L * U:\n');
disp(L*U);

% b)

for i = 1:length(R)
  fprintf('x%d: %f\n',i, R(i))
end
fprintf('\n')
% c)

B = [12; 16; -6];

[L, U, R] = descomGauss(matriz, B);

for i = 1:length(R)
  fprintf('x%d: %f\n',i, R(i))
end