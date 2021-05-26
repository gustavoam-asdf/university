clc;
syms y x;
y = 1/((1-3*x^2)^2);
y1 = diff(y);
disp('Primera derivada');
disp(y1);
fplot(y);