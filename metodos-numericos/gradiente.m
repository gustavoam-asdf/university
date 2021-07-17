clear;
close all;
clc;

syms x y i j
fxy = x * y ^ 2;
posX = 2;
posY = 2;

dF_dx = diff(fxy,x);
dF_dy = diff(fxy,y);

fprintf('df/dx: ');
disp(dF_dx);

fprintf('df/dy: ');
disp(dF_dy);

% valores en (2,2)

vdx = subs(dF_dx, y, posY);
vdx = subs(vdx, x, posX);
vdy = subs(dF_dy, x, posX);
vdy = subs(vdy, y, posY);

grad = vdx * i + vdy * j;
magGrad = (vdx^2 + vdy^2) ^ 0.5;
fprintf('Gradiente: ');
disp(grad);
fprintf('Magnitud del gradiente: %f\n\n', magGrad);

[a, b] = meshgrid(vdx: 0.5 : vdy);
quiver(a,b,b,a);
% Verificar
teta = atan(vdy/vdx);
g = 4 * cos (teta) + 8 * sin (teta);

fprintf("g'(0): ");
disp(double(g));

fprintf('Gradiende de matlab: \n');
disp(gradient(fxy));