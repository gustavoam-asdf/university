clc;

repeticiones = input('Ingrese el numero de repeticiones: ');
x = input('Ingrese el valor de x: ');

serie = 0;
iterador = 0;

while iterador <= repeticiones 

  if rem(iterador, 2) == 0
    serie = serie + (x ^ (iterador*2)) / factorial(iterador*2);
  else 
    serie = serie - (x ^ (iterador*2)) / factorial(iterador*2);
  end
  
  iterador = iterador + 1;
  
end

error = ((cos(x) - serie) / cos(x)) * 100;

disp('Valor verdadero: ');
disp(cos(x));
disp('Valor de la serie: ');
disp(serie);
disp('Error %: ');
disp(error);