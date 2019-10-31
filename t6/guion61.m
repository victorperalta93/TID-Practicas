% GUI�N 6.1 OPERACIONES ARITM�TICAS SOBRE IM�GENES

%% Paso 1
I = imread('tire.tif');
I2 = imadd(I,75);
figure
subplot(1,2,1), imshow(I);
subplot(1,2,2), imshow(I2);

% valores m�ximos y m�nimos de imagen original
max(I(:))
min(I(:))

% min 0 -> 75, max 255 -> 255
% al sumar 75 a todo, todos los valores que eran 0 ahora son 75

% contar el n�mero de pixeles con cierto valor
sum(I(:) == 255) % 301
sum(I2(:) == 255) % 2614

%% Paso 2
Ia = imread('rice.png');
Ib = imread('cameraman.tif');
Ic = imadd(Ia,Ib);

figure
imshow(Ic)

%% Paso 3
close all
clear all

%% Paso 4
I = imread('cameraman.tif');
J = imread('cameraman2.tif');

figure
subplot(1,2,1), imshow(I), title('Imagen original');
subplot(1,2,2), imshow(J), title('Imagen alterada');

%% Paso 5
diffim = imsubtract(I,J);
imshow(diffim), title('Imagen Diferencia'), impixelinfo();

%% Paso 6 
max(diffim(:))

%% Paso 7
imtool(diffim)

%% Paso 8
diffim2 = imabsdiff(I,J); figure(2)
subplot(2,2,2), imshow(diffim2), title('Imagen Diferencia en valor absoluto');

%% Paso 10
subplot(2,2,1), imshow(diffim), title('Imagen Diferencia');
subplot(2,2,2), imshow(diffim2), title('Imagen Diferencia en valor absoluto');
subplot(2,2,3), imshow(diffim,[]), title('Diferencia escalada');
subplot(2,2,4), imshow(diffim2,[]), title('Diferencia en valor absoluto escalada');

%% Paso 13
I = imread('moon.tif');
I2 = imadd(I, 50); 
I3 = immultiply(I, 1.2);
figure 
subplot(1,3,1), imshow(I), title('Imagen Original');
subplot(1,3,2), imshow(I2), title('Brillo a�adido'); 
subplot(1,3,3), imshow(I3), title('Escalado Din�mico')

%% Paso 15
I = im2double(imread('earth1.tif'));
J = im2double(imread('earth2.tif'));
K = immultiply(I,J); 
figure
subplot(1,3,1), imshow(I), title('Imagen de Planeta');
subplot(1,3,2), imshow(J), title('Gradiente');
subplot(1,3,3), imshow(K,[]), title('Planeta 3D');

%% Paso 16
I = imread('moon.tif');
I2 = imdivide(I,2); 
I3 = immultiply(I,0.5); 
figure
subplot(1,3,1), imshow(I), title('Imagen Original'); 
subplot(1,3,2), imshow(I2), title('Imagen m�s oscura por /');
subplot(1,3,3), imshow(I3), title('Imagen m�s oscura por x');

%% Paso 20
notext = imread('gradient.tif');
text = imread('gradient_with_text.tif');
figure, imshow(text), title('Imagen Original');

%% Paso 21
level = graythresh(text);
BW = im2bw(text,level);
figure, imshow(BW), title('Umbralizaci�n');

%% Paso 22
fixed = imdivide(text,notext);
figure 
subplot(1,3,1), imshow(text), title('Imagen Original'); 
subplot(1,3,2), imshow(notext), title('Fondo solamente');
subplot(1,3,3), imshow(fixed,[]), title('Divisi�n');