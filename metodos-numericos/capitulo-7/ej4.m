close all;
clear;
clc;


fprintf('a) ƒ(x) = x^3 – x^2 + 3x – 2\n');
fprintf('Raices: \n');
disp(roots([1 -1 3 -2]));

fprintf('b) ƒ(x) = 2x^4 + 6x^2 + 10\n');
fprintf('Raices: \n');
disp(roots([2 0 6 0 10]));

fprintf('c) ƒ(x) = x^4 – 2x^3 + 6x^2 – 8x + 8\n');
fprintf('Raices: \n');
disp(roots([1 -2 6 -8 8]));