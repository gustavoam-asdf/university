clear;
close all;
clc;

gen = input('Ingrese la matriz general: ');

coefs = input('Ingrese la matriz de coeficientes: ');

sols = inv(gen)*coefs.';

disp('Soluciones: ');
disp(sols);