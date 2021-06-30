% Gauss-Seidel
clear;
close all;
clc;

ecua=[3 -0.1 -0.2 7.85; 0.1 7 -0.3 -19.3; 0.3 -0.2 10 71.4];

nroEcua = 3;
x1 = zeros(nroEcua);
tol = 0.0001;
iterMax = 100;

k = 1;
while  k <= iterMax
  err = 0;
  for i = 1 : nroEcua
     s = 0;
     for j = 1 : nroEcua
        s = s-ecua(i,j)*x1(j);
     end
     s = (s+ecua(i,nroEcua+1))/ecua(i,i);
     if abs(s) > err
       err  = abs(s);
     end
     x1(i) = x1(i) + s;
  end

  if err <= tol
    break;
  else
    k = k+1;
  end
end

fprintf('Las soluciones despues de %d iteraciones con un error de %f son:\n', k-1, err);
for i = 1 : nroEcua
 fprintf('\t%11.8f \n', x1(i));
end
