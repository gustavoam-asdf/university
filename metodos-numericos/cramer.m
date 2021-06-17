clear;
close all;
clc;

gen = [2 3 4;4 -5 2;1 15 -1];
coefsEnX = [12 3 4;15 -5 2;35 15 -1];
coefsEnY = [2 12 4;4 15 2;1 35 -1];
coefsEnZ = [2 3 12;4 -5 15;1 15 35];

D1 = det(gen);
D2 = det(coefsEnX);
D3 = det(coefsEnY);
D4 = det(coefsEnZ);

x = D2/D1;
y = D3/D1;
z = D4/D1;

fprintf('x: %f, y: %f, z: %f\n', x, y, z);