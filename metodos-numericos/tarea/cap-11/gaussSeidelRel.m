function [x] = gaussSeidelRel (matriz, results, imax, err, rejalacion)
n = length(matriz);
results = results';
x = zeros(n, 1);

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
      sum = sum - matriz(i,j) * x(j);
    end
  end
  x(i) = sum;
end
iter = 1;
while iter < imax
  centinela = 1;
  for i = 1 : n
    old = x(i);
    sum = results(i);
    for j = 1 : n
      if i ~= j 
        sum = sum - matriz(i,j)*x(j);
      end
    end
    x(i) = rejalacion * sum + (1 - rejalacion) * old;
    
    if centinela = 1 && xi ~= 0
      ea = abs( (x(i) - old) / x(i)) * 100.;
      if ea > err 
        centinela = 0;
      end
    end
  end
  iter = iter + 1;
  if centinela == 1 
    return;
  end
end