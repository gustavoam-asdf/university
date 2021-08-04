clc;
clear;
close all;

datos = [8.8 9.5 9.8 9.4 10 9.4 10.1 9.2 11.3 9.4 10 10.4 7.9 10.4 9.8 9.8 9.5 8.9 8.8 10.6 10.1 9.5 9.6 10.2 8.9];

n = length(datos);

% a)
media = 0;
for dato = datos
  media = media + dato;
end
media = media / n;
fprintf('Media: %f\n', media);

% b) Desviación estándar
sumDifCua = 0;
for dato = datos
  sumDifCua = sumDifCua + (dato - media) ^ 2;
end
desvEstan = sqrt(sumDifCua / (n - 1));
fprintf('Desviación estándar: %f\n', desvEstan);

% c) Varianza
varianza = desvEstan ^ 2;
fprintf('Varianza: %f\n', varianza);

% d) Coeficiente de variacion
coefVar = desvEstan * 100 / media;
fprintf('Coeficiente de variacion: %f\n', coefVar);

% e) Intervalo de confianza del 95% para la media
p = 0.95;
a = (1 - p) / 2;

t = tinv(p+a, n - 1);

intInf = media - desvEstan * t/sqrt(n);
intSup = media + desvEstan * t/sqrt(n);

fprintf('Intervalo: %f <= u <= %f \n', intInf, intSup);

% 17.2
interv = 7.5: 0.5: 11.5;
histogram(datos,interv);