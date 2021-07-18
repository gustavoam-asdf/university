function [X] = jacobi(A, b, X, tol, maxIter)
n = length(A);

for k = 1 : maxIter
  w = X;
  for i = 1 : n
     s = A (i, 1:i-1) * w(1: i-1) + A(i, i+1:n) * w(i+1:n);
     X(i) = (b(i) - s)/A(i,i);
  end
  if norm(w-X, inf) < tol
    return
  end
end