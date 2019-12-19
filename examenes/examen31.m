% Examen 1
%% Ejercicio 1
% Leer imagen original y añadir ruido gaussiano
I = imread('eight.tif');
I_ruido = imnoise(I,'gaussian');
figure
subplot(2,2,1), imshow(I), title('Imagen Original');
subplot(2,2,2), imshow(I_ruido), title('Imagen con ruido');

% Crear un filtro de medias con tamaño por defecto 3x3
f1 = fspecial('average');
I_blur1 = imfilter(I,f1);
subplot(2,2,3), imshow(I_blur1), title('Promedio con tamaño núcleo por defecto');

% Crear un filtro de medias con tamaño 5x5
f2 = fspecial('average',[5 5]);
I_blur2 = imfilter(I,f2);
subplot(2,2,4), imshow(I_blur2),title('Promedio con tamaño núcleo 5x5');

%% Ejercicio 2
