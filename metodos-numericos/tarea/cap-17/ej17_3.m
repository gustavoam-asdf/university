clc;
clear;
close all;

data = [ 28.65 26.55 26.65 27.65 27.35 28.35 26.85 28.65 29.65 27.85 27.05 28.25 28.35 26.75 27.65 28.45 28.65 28.45 31.65 26.35 27.75 29.25 27.65 28.65 27.65 28.55 27.55 27.25];

amount = length(data);
fprintf('Data amount: %d\n', amount);

% a)
media = 0;
for d = data
  media = media + d;
end
media = media / amount;
fprintf('Media: %f\n', media);

% b) Standard desviation
sumDiffSqua = 0;
for d = data
  sumDiffSqua = sumDiffSqua + (d - media) ^ 2;
end
stanDesv = sqrt(sumDiffSqua / (amount - 1));
fprintf('Standard desviation: %f\n', stanDesv);

% c) Variance
variance = stanDesv ^ 2;
fprintf('Variance: %f\n', variance);

% d) Coeficiente de variacion
coeffVar = stanDesv * 100 / media;
fprintf('Coefficient of variation: %f\n', coeffVar);

% e) Intervalo de confianza del 95% para la media
percent = 0.90;
alfa = (1 - percent) / 2;

t = tinv(percent + alfa, amount - 1);

intInf = media - stanDesv * t/sqrt(amount);
intSup = media + stanDesv * t/sqrt(amount);

fprintf('Intervalo: %f <= u <= %f \n', intInf, intSup);

% f) Histogram. Use a range of 26 to 32 with increments of 0.5
ranInf = 26;
ranSup = 32;
inc    = 0.5;
interv = ranInf : inc : ranSup;
histogram(data,interv);

% g) Suponga normal y desviación estándar válida
percent   = 0.68;
newAmout  = amount * percent;
alfa = (1 - percent) / 2;

t = tinv(percent + alfa, amount - 1);

intInf = media - stanDesv * t/sqrt(amount);
intSup = media + stanDesv * t/sqrt(amount);

fprintf('New interval: %f <= u <= %f \n', intInf, intSup);