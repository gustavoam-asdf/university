% El método consiste en obtener los coeficientes de la parábola que pasa 
% por los tres puntos. Dichos coeficientes se sustituyen en la fórmula 
% cuadrática para obtener el valor donde la parábola interseca al eje x; 
% es decir, la raíz estimada. La aproximación se facilita al escribir la 
% ecuación de la parábola en una forma conveniente
close all;
clear;
clc;

syms x;

xr    = input('xr = ');
h     = input('h = ');
err   = input('err = ');
maxit = input('maxit = ');
fx    = input('f(x) = ');

x2 = xr;
x1 = xr + h * xr;
x0 = xr - h * xr;

f = inline(fx);   %subs(fx,x,x0);
iter = 0;
fprintf('\nIt. %d: %6.3f\n', iter, xr);
while (iter < maxit) 
  iter = iter + 1;
  h0 = x1 - x0;
  h1 = x2 - x1;
  d0 = (f(x1) - f(x0))/ h0;
  d1 = (f(x2) - f(x1))/ h1;
  a = (d1 - d0) / (h1+h0);
  b = a*h1 + d1;
  c = f(x2);
  rad = sqrt(b*b - 4*a*c);
  if (abs(b+rad) > abs(b-rad))
    den = b + rad;
  else 
    den = b - rad;
  end
  dxr = -2*c / den;
  xr = x2 + dxr;
  fprintf('It. %d: %6.3f\n', iter, xr);
  if (abs(dxr) < err*xr )
    break;
  end
  x0 = x1;
  x1 = x2;
  x2 = xr;
end
fprintf('Xr: %6.3f\n', xr);

