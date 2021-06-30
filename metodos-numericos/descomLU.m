% descomLI
clear;
close all;
clc;
format short;
matriz = input('Ingrese la matriz: ');

[n, n] = size(matriz);

L=eye(n);
U=eye(n);

for k=1:n
  L(k,k)=1;
  U(1,k)=matriz(1,k);
  for i=k:n
    U(k,i)= matriz(k,i)-L(k,1:k-1) * U(1:k-1,i);
  end
  for i=k+1:n
    L(i,k)=(matriz(i,k)-L(i,1:k-1) * U(1:k-1,k))/U(k,k);
  end
end

fprintf('Calculado manualmente\n');
fprintf('Matriz L\n');
disp(L);
fprintf('Matriz U\n');
disp(U);
fprintf('Confirmacion\n');
disp(L*U);
fprintf('Calculado por matlab\n')
[mL,mU] = lu(matriz);
fprintf('Matriz L\n');
disp(mL);
fprintf('Matriz U\n');
disp(mU);
fprintf('Confirmacion\n');
disp(mL*mU);