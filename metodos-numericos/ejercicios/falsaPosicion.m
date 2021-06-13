clc;
syms x;
f=input('Ingrese la Funcion: ');
ezplot(f,[-5,5]);
limInf=input('Ingrese limite inferior: ');
limSup=input('Ingrese limite superior: ');
errTol=input('Ingrese el porcentaje de Error: ');
fXinf = subs(f,x,limInf);
fXsup = subs(f,x,limSup);

iter=1;
errAbs(1)=100;
if fXinf*fXsup < 0
  xInf(1)=limInf;
  fXinf=subs(f,x,xInf(1));
  xSup(1)=limSup;
  fXsup=subs(f,x,xSup(1));
  xr(1)=xInf(1)-fXinf*(xSup(1)-xInf(1))/(fXsup-fXinf);
  fXr=subs(f,x,xr(1));
  fprintf('%3s\t\t%-7s\t\t%-7s\t\t%-7s\t\t%-8s\n', 'It.', 'Xa', 'Xr', 'Xb', 'Error A.');
  fprintf('%3d\t\t%7.4f\t\t%7.4f\t\t%7.4f\n',iter,xInf(iter),xr(iter),xSup(iter));
  while abs(errAbs(iter))>=errTol,
   if fXinf*fXr < 0
     xInf(iter+1)=xInf(iter);
     fXinf=subs(f,x,xInf(iter+1));
     xSup(iter+1)=xr(iter);
     fXsup=subs(f,x,xSup(iter+1));
   end
   if fXinf*fXr> 0
     xInf(1)=xr(iter);
     xSup(1)=xSup(iter);
   end
   xr(iter+1)=xInf(iter+1)-fXinf*(xSup(iter+1)-xInf(iter+1))/(fXsup-fXinf);
   errAbs(iter+1)=abs((xr(iter+1)-xr(iter))/(xr(iter+1)))*100;
   fprintf('%3d\t\t%7.4f\t\t%7.4f\t\t%7.4f\t\t%7.3f\n',iter+1,xInf(iter+1),xr(iter+1),xSup(iter+1),errAbs(iter+1));
   iter=iter+1;
  end
else
 fprintf('No existe una raíz en ese intervalo');
end