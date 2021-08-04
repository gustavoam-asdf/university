clc;
clear;

matriz = [
  8     2     -10
  -9    1     3
  15    -1    6
];

nEu   = normaEuclideana(matriz);
n1    = norma1(matriz);
nInf  = normaRegSum(matriz);

fprintf('||A||e   : %f\n', nEu);
fprintf('||A||1   : %f\n', n1);
fprintf('||A||inf : %f\n', nInf);
