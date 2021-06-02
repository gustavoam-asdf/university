clc;

inversion = input('Ingrese la inversión: ');
interes = input('Ingrese la tasa de interés: ');
tiempo = input('Ingrese el tiempo en años: ');

iterador = 0;

disp('    Años  Valor futuro');
while iterador <= tiempo
  f = inversion * (1 + interes) ^ iterador;
  disp([iterador f]);
  iterador = fix(iterador + 1);
end