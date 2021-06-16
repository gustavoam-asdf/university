clc;
close all;
clear;

syms x;
f=input('Ingrese la funciòn: ');
ezplot(f,[-5,5]);
xi=input('Ingrese el intervalo inferior: ');
xf=input('Ingrese el intervalo superior: ');
errTol=input('Error tolerado: ');
i=1;
fxi=subs(f,x,xi);
fxf=subs(f,x,xf);
ea(i)=100;
if fxi*fxf < 0
 xi(i)=xi; 
 fxi=subs(f,x,xi(i));
 
 xf(i)=xf; 
 fxf=subs(f,x,xf(i));
 
 xr(i)=(xi(i)+xf(i))/2; 
 fxr=subs(f,x,xr(i));
 
 fprintf('%3s\t\t%-11s\t\t%-11s\t\t%-11s\t\t%-11s\n', 'It.', 'Xi', 'Xr', 'Xf', 'Error A.');
 fprintf('%2d \t %11.7f \t %11.7f \t %11.7f\n',i,xi(i),xr(i),xf(i));
 while (abs(ea(i)) >= errTol)
   if fxi*fxr<0
     xi(i+1)=xi(i);
     fxi=subs(f,x,xi(i+1));
     
     xf(i+1)=xr(i);
     fxf=subs(f,x,xf(i+1));
   end
   if fxi*fxr> 0
     xi(i+1)=xr(i);
     fxi=subs(f,x,xi(i+1));
     
     xf(i+1)=xf(i);
     fxf=subs(f,x,xf(i+1));
   end 
   xr(i+1)=(xi(i+1)+xf(i+1))/2; 
   fxr=subs(f,x,xr(i+1));
   
   ea(i+1)=abs((xr(i+1)-xr(i))/(xr(i+1)));
   fprintf('%2d \t %11.7f \t %11.7f \t %11.7f \t %11.7f\n',i+1,xi(i+1),xr(i+1),xf(i+1),ea(i+1));
   i=i+1;
 end
else
 fprintf('No existe una raíz en ese intervalo');
end