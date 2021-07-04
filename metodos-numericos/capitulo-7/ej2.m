close all;
clear;
clc;

% División
[Q, R] = deconv([1  -5 1 -6 -7 10],[1 -2]);
raices = roots(Q);
poli   = poly(raices);

fprintf('Coeficientes del polinomio: \n');
disp(poli);

fprintf('Raíces: \n');
disp(raices);

fprintf('Residuo: \n');
disp(R);