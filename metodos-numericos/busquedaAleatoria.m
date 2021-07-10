clear;
close all;
clc;

syms x y
fxy = y - x - 2*x^2- 2*x*y - y^2;
dMin = -2;
dMax = 2;
rMin = 1;
rMax = 3;

ezplot(fxy, [dMin dMax rMin rMax]);


maxF = -1e-9;

maxIter = 1e2;

fprintf('It.\t\tx\t\t\t\ty\t\t\tf(x,y)\n');
for j = 1:maxIter 

  nX = dMin + (dMax - dMin) * rand();
  nY = rMin + (rMax - rMin) * rand();
  fn = subs(fxy, x, nX);
  fn = subs(fn, y, nY);

  if fn > maxF
   maxF = fn;
   maxX = nX;
   maxY = nY;
  end
  
  fprintf('%2d\t%7.4f\t%7.4f\t%7.4f\n', j, nX, nY, fn);
  
end

fprintf('Máximo x: %7.4f, Máximo y: %7.4f, Fmax: %7.4f\n', maxX, maxY, maxF);