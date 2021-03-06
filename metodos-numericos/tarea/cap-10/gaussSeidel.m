function [X, H, converg] = gaussSeidel(A, b, X, errTol, maxIter)
n = length(A);
H = zeros(maxIter, n);
converg = true;
for k = 1 : maxIter
  w = X;
  H(k, :) = [w'];
  for i = 1 : n
    s = A(i,1:i-1) * X(1: i-1) + A(i, i+1:n) * X(i+1:n);
    X(i) = ( b(i) - s) / A(i,i);
  end
  if norm(X-w, inf) <= errTol
    converg = true;
    return
  end
  if (norm(X-w, inf) > errTol) && (k == maxIter)
    converg = false;
    return
  end
end