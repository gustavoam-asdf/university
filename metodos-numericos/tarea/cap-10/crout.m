function [L, U, X] = crout(a,b)

n = size(a,1);
L = zeros(n);
U = eye(n);
b = b';
for k = 1:n
  for i = k:n
    L(i,k) = a(i,k) - L(i,1:k-1) * U(1:k-1,k);
  end
  for i = k+1:n
    U(k,i) = (a(k,i) - L(k,1:k-1) * U(1:k-1,i)) / L(k,k);
  end
end


D = L\b;

X = U\D;
