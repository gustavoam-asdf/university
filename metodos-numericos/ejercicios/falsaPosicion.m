clear;
clc;
close all;
syms x;
f=input('Ingrese la Funcion: ');
fplot(f);
xi=input('Ingrese limite inferior: ');
xf=input('Ingrese limite superior: ');
errTol=input('Error tolerado: ');
fxi = subs(f,x,xi);
fxf = subs(f,x,xf);

i=1;
errAbs(1)=100;
if fxi*fxf < 0
  xi(1)=xi;
  fxi=subs(f,x,xi(1));
  
  xf(1)=xf;
  fxf=subs(f,x,xf(1));
  
  xr(1)=xi(1)-fxi*(xf(1)-xi(1))/(fxf-fxi);
  fXr=subs(f,x,xr(1));
  
  fprintf('%3s\t\t%-7s\t\t%-7s\t\t%-7s\t\t%-8s\n', 'It.', 'Xa', 'Xr', 'Xb', 'Error A.');
  fprintf('%3d\t\t%7.4f\t\t%7.4f\t\t%7.4f\n',i,xi(i),xr(i),xf(i));
  while (abs(errAbs(i))>=errTol)
   if fxi*fXr < 0
     xi(i+1)=xi(i);
     xf(i+1)=xr(i);
   end
   if fxi*fXr > 0
     xi(i+1)=xr(i);
     xf(i+1)=xf(i);
   end
   fxi=subs(f,x,xi(i+1));
   fxf=subs(f,x,xf(i+1));
   xr(i+1)=xi(i+1)-fxi*(xf(i+1)-xi(i+1))/(fxf-fxi);
   errAbs(i+1)=abs((xr(i+1)-xr(i))/xr(i+1));
   fprintf('%3d\t\t%7.4f\t\t%7.4f\t\t%7.4f\t\t%7.3f\n',i+1,xi(i+1),xr(i+1),xf(i+1),errAbs(i+1));
   i=i+1;
  end
else
 fprintf('No existe una raíz en ese intervalo');
end