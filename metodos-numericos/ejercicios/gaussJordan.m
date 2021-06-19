clear all;
clc;
fprintf('Dame la matriz aumentada\n\n');
f=input('Cuantas filas tiene la matriz: ');
c=input('Cuantas columnas tiene la matriz: '); 
for k=1:c
  for j=1:f
    fprintf('fila : %x\n',j)
    fprintf('columna : %x\n',k)
    r=input('Numero de esta fila y columna: ');
    matriz(j,k)=r;
    j=j+1;
  end
  k=k+1;
end
disp(matriz);
pause 
for k=1:c-1
  matriz(k,:)=matriz(k,:)/matriz(k,k);
    for j=k+1:f
    matriz(j,:)=matriz(j,:)-matriz(k,:)*matriz(j,k);
    j=j+1;
    disp(matriz);
    pause
    end
  k=k+1;
  disp(matriz);
  pause

end 
for k=f:-1:2
  for j=k-1:-1:1
    matriz(j,:)=matriz(j,:)-matriz(k,:)*matriz(j,k);
    j=j-1;
    disp(matriz);
    pause
  end
  k=k-1;
  disp(matriz);
  pause
end
fprintf('resultado\n');
disp(matriz);