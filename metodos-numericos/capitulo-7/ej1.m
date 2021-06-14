close all;
clear;
clc;

syms x;

xr    = 2;
h     = 0.2;
err   = 0.000001;
maxit = 10;
fx    = (x^4 - 7.5*x^3 + 14.5*x^2 + 3*x - 20) / (x-2);
ezplot(fx, [0, 3]);

x2 = xr;
x1 = xr + h * xr;
x0 = xr - h * xr;

f = inline(fx);   %subs(fx,x,x0);
iter = 0;
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
  fprintf('It. %2d: %6.3f\n', iter, xr);
  if (abs(dxr) < err*xr )
    break;
  end
  x0 = x1;
  x1 = x2;
  x2 = xr;
end
r = xr;
fprintf('%-6s: %6.3f\n','Xr', xr);

