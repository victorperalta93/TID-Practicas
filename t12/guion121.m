% GUIÓN 12.1: REDUCCIÓN DE RUIDO EN EL DOMINIO ESPACIAL

%% Paso 1
% Carga la imagen eight.tif , añádele ruido gaussiano y muestra la imagen antes y después de añadir ruido.
I = imread('eight.tif');
In = imnoise(I,'gaussian',0,0.001);
figure, subplot(2,2,1), imshow(I), title('Imagen Original');
subplot(2,2,2), imshow(In), title('Imagen Ruidosa');

%% Paso 2
% Aplica un filtro de medias a la imagen usando el tamaño del núcleo por
% defecto 3x3
f1 = fspecial('average');
I_blur1 = imfilter(In,f1);
subplot(2,2,3), imshow(I_blur1), title('Promedio con tamaño núcleo por defecto');

%% Paso 3
% Implementa un filtro de promedio 5x5
f2 = fspecial('average',[5 5]);
I_blur2 = imfilter(In,f2);
subplot(2,2,4), imshow(I_blur2),title('Promedio con tamaño núcleo 5x5');

%% Paso 4
close all

%% Paso 5
% Carga dos versiones ruidosas de la imagen eight.tif, una con ruido sal y
% otra con ruido pimienta. Muestra la imagen original y las dos ruidosas
I_salt = im2double(imread('eight_salt.tif'));
I_pepper = im2double(imread('eight_pepper.tif'));
figure
subplot(2,3,1), imshow(I), title('Imagen original');
subplot(2,3,2), imshow(I_salt), title('Ruido de sal');
subplot(2,3,3), imshow(I_pepper), title('Ruido de Pimienta');

%% Paso 6
I_fix1 = nlfilter(I_salt,[3 3],@c_harmonic,-1);
subplot(2,3,5), imshow(I_fix1), title('Sal eliminada, r=-1');

%% Paso 7
% Filtra el ruido de pimienta en la imagen usando r=1 en el filtro
% contra-armónico
I_fix2 = nlfilter(I_salt,[3 3],@c_harmonic,1);
subplot(2,3,6), imshow(I_fix2), title('Pimienta eliminada, r=1');

%% Paso 8
% Aplicamos un filtro erróneo a la imagen con ruido pimienta (signo de r
% incorrecto)
I_bad = nlfilter(I_pepper,[3 3],@c_harmonic,-1);
subplot(2,3,4), imshow(I_bad), title('Utilizando valor de r incorrecto');

%% Paso 9
close all

%% Paso 10
% Filtra la imagen con ruido de sal con el filtro armónico.
I_fix4 = nlfilter(I_salt,[3 3],@harmonic1); 
figure 
subplot(2,3,1), imshow(I), title('Imagen Original'); 
subplot(2,3,2), imshow(I_salt), title('Ruido de Sal'); 
subplot(2,3,3), imshow(I_pepper), title('Ruido de Pimienta'); 
subplot(2,3,5), imshow(I_fix4), title('Filtrado armónico (sal)');

%% Paso 11
% Filtra la imagen con ruido de pimienta con el filtor armónico y muéstrala
I_bad2 = nlfilter(I_pepper,[3 3],@harmonic1);
subplot(2,3,6), imshow(I_bad2), title('Filtrado Armónico (pimienta)')

%% Paso 12
% Intenta filtrar la imagen In(I con ruido aditivo) con la media armónica.
% Hay que convertir la imagen a double primero.
In_d = im2double(In);
I_fix5 = nlfilter(In_d, [3 3], @harmonic1);
figure
subplot(1,3,1), imshow(I), title('Imagen Original'); 
subplot(1,3,2), imshow(In_d), title('Imagen + ruido Gaussiano'); 
subplot(1,3,3), imshow(I_fix5), title('Filtrada con Media Armónica');

%% Paso 13
close all

%% Paso 14
% Realiza un filtro con media geometrica a la imagen eight.tif con ruido
% gaussiano (en In_d)
I_fix6 = nlfilter(In_d,[3 3],@geometric); 
figure 
subplot(1,3,1), imshow(I), title('Imagen Original'); 
subplot(1,3,2), imshow(In_d), title('Ruido Gaussiano'); 
subplot(1,3,3), imshow(I_fix6), title('Filtrada con media geométrica');

%% Paso 15
close all;
clear all;

%% Paso 16
% Carga la imagen coins.png y añadele ruido de sal y pimienta
I = imread('coins.png'); 
I_snp = imnoise(I,'salt & pepper'); 
figure 
subplot(1,3,1), imshow(I), title('Imagen Original');
subplot(1,3,2), imshow(I_snp), title('Ruido de Sal y Pimienta');

%% Paso 17
% Filtra la imagen utilizando la función medfilt2
I_filt = medfilt2(I_snp,[3 3]);
subplot(1,3,3), imshow(I_filt), title('Imagen Filtrada');


%% Paso 18
% Aplica el filtro a una imagen con ruido gaussiano
I_g = imnoise(I,'gaussian');
I_filt2 = medfilt2(I_g,[3 3]);
figure 
subplot(1,3,1), imshow(I), title('Imagen Original');
subplot(1,3,2), imshow(I_g), title('Ruido Gaussiano');
subplot(1,3,3), imshow(I_filt2), title('Filtrada')

%% Paso 19
close all;
clear all;

%% Paso 20
% Usa ordfilt2 para eliminar el ruido de sal usando un filtro de mínimo
I_s = imread('eight_salt.tif');
I2 = ordfilt2(I_s, 1, ones(3,3));
figure 
subplot(1,2,1), imshow(I_s), title('Ruido de Sal');
subplot(1,2,2), imshow(I2), title('Filtro de Mínimo');

%% Paso 21
% Filtra una imagen con ruido de pimienta usando el máximo.
I_p = imread('eight_pepper.tif');
I3 = ordfilt2(I_p, 9, ones(3,3)); 
figure 
subplot(1,2,1), imshow(I_p), title('Ruido de Pimienta'); 
subplot(1,2,2), imshow(I3), title('Filtro de Máximo');

%% Paso 22
% Filtra una imagen con ruido gaussiano usando el punto medio
I = imread('coins.png'); 
I_g = imnoise(I,'gaussian',0,0.001);
midpoint = @(x) 0.5 * (max(x(:)) + min(x(:))); 
I_filt = nlfilter(I_g,[3 3],midpoint); 
figure 
subplot(1,2,1), imshow(I_g), title('Ruido Gaussiano'); 
subplot(1,2,2), imshow(I_filt), title('Filtro de Punto Medio');

%% Paso 23
close all;
clear all;

%% Paso 24
% Genera una imagen ruidosa con ruido gaussiano y de sal y pimienta
I = imread('cameraman.tif');
Id = im2double(I); 
In = imnoise(Id,'salt & pepper');
In2 = imnoise(In,'gaussian');

%% Paso 25
% Filtra la imagen con un filtro de media alfa-recortado
I_filt = nlfilter(In2,[5 5],@atmean,6);
figure 
subplot(1,3,1), imshow(I), title('Original Image'); 
subplot(1,3,2), imshow(In2), title('Ruido S&P y Gaussiano'); 
subplot(1,3,3), imshow(I_filt), title('Media Alfa-Recortada');