clear;
close all;
clc;

% acumulador = entradas - salidas
syms c12 c15 c23 c24 c25 c31 c34 c44 c54 c55
q01 = 5;
q31 = 5;
q12 = 3;
q23 = 1;
q24 = 1;
q25 = 1;
q15 = 3;
q54 = 2;
q03 = 8;
q34 = 8;
q44 = 11;
q55 = 2;

c01 = 10;
c03 = 20;

% Para C1
entrada = q01 * c01 + q31 * c31;
salida = q12 * c12 + q15 * c15;

solve(entrada == salida)