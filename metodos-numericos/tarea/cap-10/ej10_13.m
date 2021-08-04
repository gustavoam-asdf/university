clc;
clear;

n       = 5;
matriz  = hilb(n);
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