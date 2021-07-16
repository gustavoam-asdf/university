function [a, o, s] = pivot(a, o, s, k)
n = length(a);
p = k;
big = abs(a(k,k) /s(k));

for ii = k + 1: n
  dummy = abs(a(ii,k) /s(ii));
  if dummy > big
    big = dummy;
    p = ii;
  end
end
dummy = o(p);
o(p) = o(k);
o(k) = dummy;