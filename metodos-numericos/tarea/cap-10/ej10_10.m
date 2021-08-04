clc;
clear;

matriz10_3 = [
  8     4     -1
  -2    5     1
  2     -1    6
];

nEu   = normaEuclideana(matriz10_3);
n1    = norma1(matriz10_3);
nRegSum  = normaRegSum(matriz10_3);

fprintf('Para la matriz del ej 10.3\n')
fprintf('||A||e   : %f\n', nEu);
fprintf('||A||1   : %f\n', n1);
fprintf('||A||inf : %f\n\n', nRegSum);

matriz10_4 = [
  2     -6    -1
  -3    -1    7
  -8    1     -2
];

nEu   = normaEuclideana(matriz10_4);
n1    = norma1(matriz10_4);
nRegSum  = normaRegSum(matriz10_4);

fprintf('Para la matriz del ej 10.4\n')
fprintf('||A||e   : %f\n', nEu);
fprintf('||A||1   : %f\n', n1);
fprintf('||A||inf : %f\n\n', nRegSum);