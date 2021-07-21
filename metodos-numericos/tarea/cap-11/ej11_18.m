clc;
clear;
close all;
n = 10;
matriz = hilb(n);

matrizInv = inv(matriz);

identidad = eye(n);
esCorrecto = true;

test = matriz * matrizInv;

nroCond = cond(matriz);
disp('Numero de condición: ')
disp(nroCond);

if nroCond > 1
  disp('El problema está mal condicionado');
end
if nroCond < 1
  disp('El problema está bien condicionado');
end
if nroCond == 1
  disp('El problema está perfectamente condicionado');
end

digSigIeee = 7.2;
condicionamiento = log10(nroCond);

errRedondeo = 10 ^ (condicionamiento - digSigIeee);

fprintf('La solución puede tener errores de redondeo de hasta %.4f dígitos\n', errRedondeo);

% b)
results = zeros(1,n);
for i = 1:n
  results(i) = sum(matriz(i,:));
end

[~, ~, obtenido] = descomLU(matriz, results);

esperado = ones(n,1);
diferencia = zeros(n, 1); 
for i = 1: n
  diferencia(i) = obtenido(i) - esperado(i);
  variable(1, i) = string(strcat(['x' num2str(i)]));
end
variable = variable';

fprintf('Resultados son:\n');
table = table(variable, esperado, diferencia);

disp(table);

