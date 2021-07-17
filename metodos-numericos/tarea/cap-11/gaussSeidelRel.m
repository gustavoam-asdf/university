function [X] = gaussSeidelRel (matriz, results, X, maxIter, errTol, relajacion)
n = length(matriz);
X = X';
X = zeros(n, 1);

for i = 1:n
  dummy = matriz(i,i);
  for j = 1:n
    matriz(i,j) = matriz(i,j)/dummy;
  end
  results(i) = results(i)/dummy;
end

for i = 1 : n
  sum = results(i);
  for j = 1 : n
    if i ~= j 
      sum = sum - matriz(i,j) * X(j);
    end
  end
  X(i) = sum;
end
iter = 1;
while iter < maxIter
  centinela = 1;
  for i = 1 : n
    old = X(i);
    sum = results(i);
    for j = 1 : n
      if i ~= j 
        sum = sum - matriz(i,j)*X(j);
      end
    end
    X(i) = relajacion * sum + (1 - relajacion) * old;
    
    if centinela == 1 && X(i) ~= 0
      ea = abs( (X(i) - old) / X(i)) * 100.;
      if ea > errTol 
        centinela = 0;
      end
    end
  end
  iter = iter + 1;
  if centinela == 1 
    return;
  end
end