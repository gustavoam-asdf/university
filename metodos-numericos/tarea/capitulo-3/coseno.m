clc;
x = 0.3 * pi;
errorTolerado = 0.5e-08;

serie = 0;
iterador = 0;
error = 999999;

while error >= errorTolerado
  if rem(iterador, 2) == 0
   serie = serie + (x ^ (iterador*2)) / factorial(iterador*2);
  else 
   serie = serie - (x ^ (iterador*2)) / factorial(iterador*2);
  end
  error = abs(cos(x) - serie)/cos(x);
  fprintf('iteracion = %2.0f, serie = %0.8f, error = %0.1e\n',iterador, serie, error);
  iterador = iterador + 1;
end