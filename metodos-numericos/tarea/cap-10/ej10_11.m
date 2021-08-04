clc;
clear;

matriz = [
  0.125     0.25      0.5       1
  0.015625  0.625     0.25      1
  0.00463   0.02777   0.16667   1
  0.001953  0.015625  0.125     1
];

nMatriz  = normaRegSum(matriz);
nInv     = normaRegSum(inv(matriz));

fprintf('||A||inf       : %f\n', nMatriz);
fprintf('||inv(A)||inf  : %f\n', nInv);

nroCond = nMatriz * nInv;

fprintf('Nro de cond    : %f\n', nroCond);

digSigIeee = 7.2;
condicionamiento = log10(nroCond);

errRedondeo = 10 ^ (condicionamiento - digSigIeee);

fprintf('La solución puede tener errores de redondeo de hasta %f dígitos\n\n', errRedondeo);