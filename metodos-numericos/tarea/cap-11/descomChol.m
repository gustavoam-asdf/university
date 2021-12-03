function [L, X] = descomChol(matriz, results)
results =  results';
n = length(matriz);
L = zeros(n);

for i = 1:n 
  % L(i,:) * L(i,:)' : multiplicacion escalar de toda la fila
  L(i,i) = sqrt( matriz(i,i) - L(i,:) * L(i,:)' ); 
  for k = (i+1):n 
    % L(i,:) * L(k,:)' : multiplicacion escalar
    L(k,i) = ( matriz(k,i) - L(i,:) * L(k,:)' ) / L(i,i); 
  end
end

% U : traspuesta de L
U = L';

% B * D = L
D = L\results;

% D * X = U
X = U\D;
