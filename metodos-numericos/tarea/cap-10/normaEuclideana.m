function [norma] = normaEuclideana(matriz)
[n, m] = size(matriz);
norma = 0;
for i = 1:n
  for j = 1:m
    norma = norma + matriz(i,j) ^ 2;
  end
end