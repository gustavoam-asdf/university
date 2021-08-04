clc;
clear;

matriz  = vander([4 2 7]);
nMatriz  = normaRegSum(matriz);
nInv     = normaRegSum(inv(matriz));
nroCond = nMatriz * nInv;

fprintf('a) Nro de cond: %f\n', nroCond);