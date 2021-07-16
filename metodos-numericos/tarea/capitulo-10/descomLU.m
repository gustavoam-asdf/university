function [a, b, R] = descomLU(a, b, tol)
n = length(a);
er = 0;
o = zeros(n);
s = zeros(n);
R = zeros(n,1);
[a, o, s, er] = descom(a, tol, o, s, er);

if er == -1 
  [a, b, R] = substitute(a, b);
end