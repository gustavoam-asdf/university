function [L, U, X] = descomLU(matriz, results)
n = length(matriz);   % Longitud de la matriz
results = results';   % El vector de resultados debe ser una sola columna

L=zeros(n);           % Matriz triangular inferior
U=zeros(n);           % Matriz triangular superior

for k=1:n
  L(k,k) = 1;           % Matriz inferior con diagonal principal de 1s
  U(1,k) = matriz(1,k); % La primera fila de U es la misma que la primera fila de la matriz
  for i = k : n
    % L(k,1:k-1) * U(1:k-1,i) : Multiplicacion escalar
    U(k,i) = matriz(k,i) - L(k,1:k-1) * U(1:k-1,i);
  end
  for i=k+1:n
    % L(i,1:k-1) * U(1:k-1,k) : Multiplicacion escalar
    L(i,k) = ( matriz(i,k) - L(i,1:k-1) * U(1:k-1,k) ) / U(k,k);
  end
end

% L * D = B
D = L\results;      % <> inv(L) * results

% D * X = U
X = U\D;            % <> inv(U) * results