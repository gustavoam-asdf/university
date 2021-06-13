2clc;
syms x;
f=input('Ingrese la funciòn: ');
ezplot(f,[-5,5]);
xai=input('Ingrese el intervalo inferior: ');
xbi=input('Ingrese el intervalo superior: ');
tol=input('Ingrese el porcentaje de error: ');
i=1;
f1=subs(f,x,xai);
f2=subs(f,x,xbi);
ea(i)=100;
if f1*f2 < 0
 xa(i)=xai; f1=subs(f,x,xa(i));
 xb(i)=xbi; f2=subs(f,x,xb(i));
 xr(i)=(xa(i)+xb(i))/2; f3=subs(f,x,xr(i));
 fprintf('It. Xa Xr Xb Error aprox \n');
 fprintf('%2d \t %11.7f \t %11.7f \t %11.7f\n',i,xa(i),xr(i),xb(i));
 while abs(ea(i)) >= tol,
 if f1*f3<0
 xa(i+1)=xa(i);f1=subs(f,x,xa(i+1));
 xb(i+1)=xr(i);f2=subs(f,x,xb(i+1));
 end
 if f1*f3> 0
 xa(i+1)=xr(i);f1=subs(f,x,xa(i+1));
 xb(i+1)=xb(i);f2=subs(f,x,xb(i+1));
 end 
 xr(i+1)=(xa(i+1)+xb(i+1))/2; f3=subs(f,x,xr(i+1));
 ea(i+1)=abs((xr(i+1)-xr(i))/(xr(i+1))*100);
 fprintf('%2d \t %11.7f \t %11.7f \t %11.7f \t %7.7f\n',...
 i+1,xa(i+1),xr(i+1),xb(i+1),ea(i+1));
 i=i+1;
 end
else
 fprintf('No existe una raíz en ese intervalo');
end