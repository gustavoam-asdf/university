function [norma] = norma1(matriz)
[n, m] = size(matriz);
norma = 0;
for i = 1:n
  for j = 1:m
    norma = norma + abs(matriz(i,j));
  end
end