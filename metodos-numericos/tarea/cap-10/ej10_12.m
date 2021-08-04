clc;
clear;

matriz = [
  1     4     9     16      25
  4     9     16    25      36
  9     16    25    36      49
  16    25    36    49      64
  25    36    49    64      81
];

nMatriz  = normaRegSum(matriz);
nInv     = normaRegSum(inv(matriz));
nroCond  = nMatriz * nInv;

fprintf('a) Número de condición: %f\n', nroCond);

digSigIeee = 7.2;
condicionamiento = log10(nroCond);

errRedondeo = 10 ^ (condicionamiento - digSigIeee);

fprintf('La solución puede tener errores de redondeo de hasta %f dígitos\n\n', errRedondeo);

matriz = matriz./81;

nMatriz  = normaRegSum(matriz);
nInv     = normaRegSum(inv(matriz));
nroCond  = nMatriz * nInv;

fprintf('b) Número de condición: %f\n', nroCond);

digSigIeee = 7.2;
condicionamiento = log10(nroCond);

errRedondeo = 10 ^ (condicionamiento - digSigIeee);

fprintf('La solución puede tener errores de redondeo de hasta %f dígitos\n\n', errRedondeo);
