function [norma] = normaRegSum(matriz)
[n, ~] = size(matriz);

sumaFila = zeros(1,n);
for i = 1:n
  sumaFila(i) = sum(abs(matriz(i,:)));
end
norma = max(sumaFila);