% EJEMPLO 1

%% Ejercicio 1
% Carga  la  imagen  blobs.png  y  muéstrala.  
I = imread('blobs.png');
figure, imshow(I);

% Crea  un  elemento  estructural  3x3  con  todos  sus coeficientes iguales a 1. 
st = strel('square',3);

% Realiza y explica que va a ocurrir cuando hacemos una dilatación con dicho elemento estructural.
b = imdilate(I,st);

% Dibuja el resultado
figure, imshow(b);

%% Ejercicio 2
% Carga y muestra la imagen morph.bpm. Quita a la imagen original su versión erosionada y muéstrala
I = imread('morph.bmp');
figure, imshow(I);
c = imerode(I,st);
I2 = imsubtract(I,c);
figure, imshow(I2);