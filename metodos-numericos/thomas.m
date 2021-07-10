clear;
close all;
clc;

%e subdiagonal del vector
e = [0;-1;-1;-1];

%f diagonal del vector
f = [2.04;2.04;2.04;2.04];

%g diagonal superior del vector
g = [-1;-1;-1];

%r lado derecho del vector
r = [40.8;0.8;0.8;200.8];

n = length(f);

%eliminacion hacia delante
for k=2:n
    factor =e(k)/f(k-1);
    f(k)=f(k)-factor*g(k-1);
    r(k)=r(k)-factor*r(k-1);
end

%sustitución trasera
x(n) = r(n)/f(n);

for k=n-1:-1:1
    x(k)=(r(k)-g(k)*x(k+1))/f(k);
end
for l=length(x):-1:1
    fprintf('\nT%d = %f\n', l, x(l));
end