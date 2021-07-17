function [T] = thomas(matriz, results)

results = results';

n = length(matriz);

diagSup = zeros(n,1);
diagInf = zeros(n,1);
diagPri = zeros(n,1);

for i = 1 : n - 1
  diagSup(i) = matriz(i,i+1);
  diagInf(i) = matriz(i+1, i);
  diagPri(i) = matriz(i,i);
end

diagSup(n) = diagSup(n-1);
diagInf(n) = diagInf(n-1);
diagPri(n) = matriz(n, n);

%eliminacion hacia delante
for k=2:n
    factor      = diagInf(k) / diagPri(k-1);
    diagPri(k)  = diagPri(k) - factor*diagSup(k-1);
    results(k)  = results(k) - factor*results(k-1);
end

%sustitución trasera
T(n) = results(n)/diagPri(n);

for k=n-1:-1:1
    T(k)  =   (results(k)-diagSup(k)*T(k+1))/diagPri(k);
end