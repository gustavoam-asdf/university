clc;
clear;
close all;

data = [ 28.65 26.55 26.65 27.65 27.35 28.35 26.85 28.65 29.65 27.85 27.05 28.25 28.35 26.75 27.65 28.45 28.65 28.45 31.65 26.35 27.75 29.25 27.65 28.65 27.65 28.55 27.55 27.25];

amount = length(data);
fprintf('Data amount: %d\n', amount);

% a) Arithmetic Average
average = 0;
for d = data
  average = average + d;
end
average = average / amount;
fprintf('Average: %f\n', average);

% b) Standard desviation
sumDiffSqua = 0;
for d = data
  sumDiffSqua = sumDiffSqua + (d - average) ^ 2;
end
stanDesv = sqrt(sumDiffSqua / (amount - 1));
fprintf('Standard desviation: %f\n', stanDesv);

% c) Variance
variance = stanDesv ^ 2;
fprintf('Variance: %f\n', variance);

% d) Coefficient of variation.
coeffVar = stanDesv * 100 / average;
fprintf('Coefficient of variation: %f\n', coeffVar);

% e) 90% confidence interval for the arithmetic average.
percent = 0.90;
alfa = (1 - percent) / 2;

t = tinv(percent + alfa, amount - 1);

lowerInt = average - stanDesv * t/sqrt(amount);
upperInt = average + stanDesv * t/sqrt(amount);

fprintf('Interval: %f <= u <= %f \n', lowerInt, upperInt);

% f) Histogram. Use a range of 26 to 32 with increments of 0.5
lowerRange = 26;
upperRange = 32;
inc    = 0.5;
interv = lowerRange : inc : upperRange;
histogram(data,interv);

% g) Assume normal and valid standard deviation for 68 %
percent   = 0.68;
alfa = (1 - percent) / 2;

t = tinv(percent + alfa, amount - 1);

lowerInt = average - stanDesv * t/sqrt(amount);
upperInt = average + stanDesv * t/sqrt(amount);

fprintf('New interval: %f <= u <= %f \n', lowerInt, upperInt);