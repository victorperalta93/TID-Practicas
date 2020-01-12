% EJEMPLO 2

%% Ejercicio 1
% Carga  la  imagen  blobs.png  y  muéstrala.  
I = imread('blobs.png');
figure, imshow(I);

% Crea  un  elemento  estructural  1x7  con  todos  sus coeficientes iguales a 1. 
ee = strel('rectangle', [1 7]);

% Realiza y explica que va a ocurrir cuando hacemos una dilatación con dicho elemento estructural. 
b = imdilate(I,ee);

% Dibuja el resultado
figure, imshow(b);

%% Ejercicio 2
% Rellena los huecos de la imagen morph.bpm usando imfill y muestra el resultado
I = imread('morph.bmp');
res = imfill(I,'holes');
figure, imshow(res);