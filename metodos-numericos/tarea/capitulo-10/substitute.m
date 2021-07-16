function [a, b, R] = substitute(a, b)

n = length(a);

% Sustitucion hacia adelante
for i = 2 : n
  sum = b(i);
  for j = 1: i -1
    sum = sum - a(i,j) * b(j);
  end
  b(i) = sum;
end

% Sustitucion hacia atras
R(n) = b(n)/a(n,n);
for i = n-1 : -1 : 1
  sum = 0;
  for j = i + 1: n
    sum = sum + a(i,j) * R(j);
  end
  R(i) = (b(i) - sum)/a(i,j);
end