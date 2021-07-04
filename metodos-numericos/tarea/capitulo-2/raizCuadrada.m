clc;

raiz = 0;

numero = input('Ingrese el numero del cual obtendremos la raiz: ');

error = 999999;

if numero > 0
  errorTolerado = 10^-5;
  x = numero / 2;
  while error > errorTolerado
    y = (x+numero/x)/2;
    error = abs(y- x)/y;
    x = y;
  end
  raiz = x;
else
  raiz = 0;
end

disp('Las raíz cuadrada verdadera es: ');
disp(sqrt(numero));
disp('La raiz calculada es: ');
disp(raiz);
disp('El error es: ');
disp(error);