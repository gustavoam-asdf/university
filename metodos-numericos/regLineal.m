function [syx, r2, a1, a0]  = regLineal(x, y, n)
% r2 : coeficiente de determinacion
% r  : coeficiente de correlación
% syx: error estándar estimado
  sumx = 0; 
  sumxy = 0; 
  st = 0;
  
  sumy = 0;
  sumx2 = 0;
  sr = 0;
  
  for i = 1: n
    sumx = sumx + x(i);
    sumy = sumy + y(i);
    sumxy = sumxy + x(i)*y(i);
    sumx2 = sumx2 + x(i)*x(i);
  end
  xm = sumx/n;
  ym = sumy/n;
  a1 = (n*sumxy - sumx*sumy)/(n*sumx2 - sumx*sumx);
  a0 = ym - a1*xm;
  for i = 1: n
    st = st + (y(i) - ym) ^ 2;
    sr = sr + (y(i) - a1*x(i) - a0) ^ 2;
  end
  syx = (sr/(n - 2)) ^ 0.5;
  r2 = (st - sr)/st;
end