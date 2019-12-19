% GUIÓN 14: UMBRALIZACIÓN DE IMÁGENES

%% Paso 1
% Carga y muestra la imagen test.
I = imread('coins.png'); 
figure, imshow(I), title('Imagen Original');

%% Paso 2
% Muestra el histograma de la imagen coins.png para determinar qué umbral
% debemos usar.
figure, imhist(I), title('Histograma de la imagen');

%% Paso 4
% Selecciona el umbral 85 y genera la nueva imagen.
T = 85; 
I_thresh = imbinarize(I,( T / 255));
figure, imshow(I_thresh), title('Imagen Umbralizada (heurístico)');

%% Paso 5
% Vamos a pasar ahora a realizar la umbralización automática usando la
% función graythresh
T2 = graythresh(I); 
I_thresh2 = imbinarize(I,T2);
figure, imshow(I_thresh2), title('Imagen umbralizada (graythresh)');

%% Paso 6
close all;
clear;

%% Paso 7
% Carga la imagen gradient_with_text.tif y muestrala
I = imread('gradient_with_text.tif');
figure, imshow(I), title('Imagen original');

%% Paso 8
% Umbraliza la imagen globalmente
I_gthresh = imbinarize(I,graythresh(I));
figure, imshow(I_gthresh), title('Umbralizacion Global');
figure, imhist(I), title('Histograma de la Imagen Original');

%% Paso 9
close all;

%% Paso 12
% Realiza la umbralización adaptativa llamando a la siguiente orden
I_thresh = blkproc(I,[10 10],@adapt_thresh);

%% Paso 13
% Muestra la imagen original y la nueva imagen
figure 
subplot(1,2,1), imshow(I), title('Imagen Original'); 
subplot(1,2,2), imshow(I_thresh), title('Umbralizacion Adaptativa');

%% Paso 14
% Calcula la desviación típica de dos bloques 10x10, uno donde hay texto y
% otro donde no lo hay
std_without_text = std2(I(1:10, 1:10));
std_with_text = std2(I(100:110, 100:110));

%% Paso 16
% Ahora vuelve a ejecutar el procesado por bloques para ver que ocurre
I_thresh2 = blkproc(I,[10 10],@adapt_thresh);
figure, subplot(1,2,1), imshow(I), title('Imagen original');
subplot(1,2,2), imshow(I_thresh2), title('Umbralización Adaptativa');