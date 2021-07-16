function [L, U] = descomGauss(matriz)

n = length(matriz);
for i = 1:n
  L(i,i) = 1;
end
U = matriz;
for k = 1:n-1
  for i = k+1:n
    L(i, k) = U(i, k) / U(k,k);
    U(i, :) = U (i, :) - L(i, k) * U(k, :);
  end
end