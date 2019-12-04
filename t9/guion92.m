% GUIÓN 9.2 Ecualización y Especificación de Histograma

%% Paso 1
% Muestra la imagen pout.tif y su histograma
I = imread('pout.tif');
figure, subplot(2,2,1), imshow(I),title('Imagen Original')
subplot(2,2,2), imhist(I)

%% Paso 2
% Utiliza la función histeq para ecualizar el histograma
I_eq = histeq(I,256);

%% Paso 3
% Muestra la imagen ecualizada y su histograma
subplot(2,2,3), imshow(I_eq), title('Imagen Ecualizada')
subplot(2,2,4), imhist(I_eq), title('Histograma Ecualizado')

%% Paso 4
close all
clear all

%% Paso 5
% Ecualizar el histograma de la imagen tire.tif
I = imread('tire.tif');
I_eq = histeq(I,256);
figure, subplot(2,2,1), imshow(I), title('Imagen Original')
subplot(2,2,2), imhist(I), title('Histograma Original')
subplot(2,2,3), imshow(I_eq), title('Imagen Ecualizada') 
subplot(2,2,4), imhist(I_eq), title('Histograma Ecualizado')

%% Paso 6
close all
clear all

%% Paso 7
% Ecualiza el histograma de la imagen eight.tif
I = imread('eight.tif');
I_eq = histeq(I,256);
figure, subplot(2,2,1), imshow(I), title('Imagen Original')
subplot(2,2,2), imhist(I), title('Histograma original')
subplot(2,2,3), imshow(I_eq), title('Imagen ecualizada')
subplot(2,2,4), imhist(I_eq), title('Histograma ecualizado')

%% Paso 8
% Muestra la función de distribución de la distribución asociada a
% eight.tif
% cumsum = suma acumulativa
% a,b,c => a, a+b, a+b+c
I_hist = imhist(I);
tf = cumsum(I_hist);
tf_norm = tf / max(tf);
figure, plot(tf_norm), axis tight

%% Paso 9
% La función de transformación puede obtenerse sin utilizar cumsum
[newmap, T] = histeq(I);
figure, plot(T)

%% Paso 10
close all
clear all

%% Paso 11
% Prepara una subgráfica para mostrar una imagen original y su histograma
img1 = imread('pout.tif');
figure, subplot(3,3,1), imshow(img1), title('Imagen original')
subplot(3,3,2), imhist(img1), title('Histograma original');

%% Paso 12
% Muestra la imagen después de la ecualización del histograma
img1_eq = histeq(img1); m1 = ones(1,256)*0.5; 
subplot(3,3,4), imshow(img1_eq), title('Imagen Ecualizada')
subplot(3,3,5), imhist(img1_eq), title('Histograma Ecualizado')
subplot(3,3,6), plot(m1), title('Forma del Histograma Deseado'),
ylim([0 1]), xlim([1 256])

%% Paso 13
% Muestra las imagenes emparejadas cuando la forma del histograma deseado
% es una linea recta del (0,0) al (1,1)
m2 = linspace(0,1,256);
img2 = histeq(img1,m2); 
subplot(3,3,7), imshow(img2), title('Ma') 
subplot(3,3,8), imhist(img2), title('Histograma acoplado') 
subplot(3,3,9), plot(m2), title('Forma del Histograma Deseado'), 
ylim([0 1]), xlim([1 256])

%% Paso 14
close all
clear all

%% Paso 15
% Ejecuta la demo Interactive Histogram Matching Demo
ihmdemo('pout.tif');