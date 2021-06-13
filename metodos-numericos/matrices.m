clc;
mat1 = [1 2 3; 4 5 6; 7 8 9];
mat2 = [0 11 4; -3 -6 9; 22 65 -12];

suma = mat1+mat2;
prod = mat1*mat2;
deter = det(suma);
inver = inv(suma);

fprintf("Matriz 1\n");
disp(mat1);
fprintf("Matriz 2\n");
disp(mat2);
fprintf("Matriz Suma\n");
disp(suma);
fprintf("Determinante suma: %f\n\n", deter);
fprintf("Matriz inversa de suma\n");
disp(inver);
fprintf("Matriz Producto\n");
disp(prod);