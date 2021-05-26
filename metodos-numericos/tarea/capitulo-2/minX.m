clc;
num2zero = 1;
exponent = 0;

while num2zero > 0
  num2zero = num2zero / 2 ;
  exponent = exponent - 1;
end

exponent = exponent + 1;

disp('Exponente: ');
disp(exponent);
disp('Xmin: ');
disp(2^exponent)