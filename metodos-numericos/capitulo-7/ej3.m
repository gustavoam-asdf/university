close all;
clear;
clc;
hold on;

syms x;
fprintf('a) ƒ(x) = x^3 + x^2 – 3x – 5\n');
fx = x^3 + x^2 - 3*x - 5;
fprintf('Función: %s\n', fx);
fprintf('Raíces: \n');
disp(roots([1 1 -3 -5]));

muller(2, 0.1, 0.000001, 10, fx);

fprintf('b) ƒ(x) = x^3 – 0.5x^2 + 4x – 3\n');

gx = x^3 - 0.5*x^2 + 4*x - 3;
fprintf('Función: %s\n', gx);
fprintf('Raíces: \n');
disp(roots([1 -0.5 4 -3]));

muller(1, 0.1, 0.000001, 10, gx);