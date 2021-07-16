clc;
clear;
close all;

n = 15;
y = [10 16.3 23 27.5 31 35.6 39 41.5 42.9 45 46 45.5 46 49 50]';
x = 1:n;
x = x';

[syx, r2, a1, a0] = regLineal(x, y, n);

disp(syx)
disp(r2)

syms rx ry

ry = a0 + a1 * rx;

disp(ry);
plot(y);
hold on;
fplot(ry);