clear;
close all;
clc;

syms x y i j h
fxy = 2 * x * y + 2 * x - x ^ 2 - 2 * y ^ 2;
posX = -1;
posY = 1;

dF_dx = diff(fxy,x);
dF_dy = diff(fxy,y);

fprintf('df/dx: ');
disp(dF_dx);

fprintf('df/dy: ');
disp(dF_dy);

% valores en (-1,1)

vdx = subs(dF_dx, y, posY);
vdx = subs(vdx, x, posX);
vdy = subs(dF_dy, x, posX);
vdy = subs(vdy, y, posY);

grad = vdx * i + vdy * j;
fprintf('Gradiente: ');
disp(grad);

newX = posX + vdx * h;
newY = posY + vdy * h;

fprintf('f(%s,%s)\n\n', newX, newY);

g = subs(fxy, x, newX);

g = subs(g, y, newY);

fprintf('Nueva funcion unidimensional g(h): ');
disp(g);