function [a, o, s, er] = descom(a, tol, o, s, er)
n = length(a);

for i = 1:n
  o(i) = i;
  s(i) = abs(a(i,1));
  for j = 2:n
    if abs(a(i,j)) > s(i)
      s(i) = abs(a(i,j));
    end
  end
end

disp(o)
disp(s)

for k = 1:n-1
  [a, o, s] = pivot(a, o, s, k);
  if abs(a(k,k) / s(k)) < tol
    er = -1;
    disp(a(k,k)/s(k))
    break
  end
  for i = k+1:n
    factor = a(i,k) / a(k,k);
    a(i,k) = factor;
  end
  for j = k+1: n
    a(i,j) = a(i,j) - factor * a(k,j);
  end
end

if abs(a(k,k)/s(k)) < tol
  er = -1;
  disp (a(k,k)/s(k));
end