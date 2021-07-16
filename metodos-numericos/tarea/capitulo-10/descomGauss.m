function [L, U, R] = descomGauss(matrizEc, matrizTI)
n = length(matrizEc);
U = [matrizEc'; matrizTI']';
L = zeros(n);

for k = 1:n
  for i = [1:k-1 k+1:n]
    L(i, k) = U(i, k) / U(k,k);
    U(i, :) = U (i, :) - L(i, k) * U(k, :);
  end
end

R = U(:, n+1)./diag(U);

L = zeros(n);
for i = 1:n
  L(i,i) = 1;
end

U = matrizEc;
for k = 1:n-1
  for i = k+1:n
    L(i, k) = U(i, k) / U(k,k);
    U(i, :) = U (i, :) - L(i, k) * U(k, :);
  end
end