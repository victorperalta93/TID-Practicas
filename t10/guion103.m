% GUIÓN 10.2: FILTROS DE AISLAMIENTO EN EL DOMINIO ESPACIAL

%% Paso 1
% Carga la imagen moon.tif y prepara la figura
I = imread('moon.tif');
Id = im2double(I); % Este paso es necesario para aplicar laplaciano correctamente
figure, subplot(2,2,1), imshow(Id), title('Imagen original');

%% Paso 2
% Crea un núcleo laplaciano y aplícalo a la imagen
f = fspecial('laplacian',0);
I_filt = imfilter(Id,f);
subplot(2,2,2), imshow(I_filt), title('Laplaciano del original');

%% Paso 3
% Muestra una versión escalada del laplaciano para visualización
subplot(2,2,3), imshow(I_filt,[]), title('Laplaciano Escalado');

%% Paso 4
% Resta el laplaciano de la imagen original para realzarla
I_sharp = imsubtract(Id,I_filt);
subplot(2,2,4), imshow(I_sharp), title('Imagen realzada');

%% Paso 5
% Usa la máscara laplaciana compuesta para realizar realzado en un paso
f2 = [0 -1 0; -1 5 -1; 0 -1 0]
I_sharp2 = imfilter(Id,f2);
figure, subplot(1,2,1), imshow(Id), title('Imagen original');
subplot(1,2,2), imshow(I_sharp2), title('Laplaciano compuesto');

%% Paso 5.1
% Tener en cuenta los 8 vecinos
f = fspecial('laplacian',1)
I_filt = imfilter(Id,f);
subplot(2,2,2), imshow(I_filt), title('Laplaciano del original');
subplot(2,2,3), imshow(I_filt,[]), title('Laplaciano Escalado');
I_sharp = imsubtract(Id,I_filt);
subplot(2,2,4), imshow(I_sharp), title('Imagen realzada');

%% Paso 6
close all
clear all

%% Paso 7
% Carga la imagen moon y genera una imagen borrosa
I = imread('moon.tif');
f_blur = fspecial('average',5);
I_blur = imfilter(I,f_blur);
figure, subplot(1,3,1), imshow(I), title('Imagen Original');
subplot(1,3,2), imshow(I_blur), title('Imagen Borrosa');

%% Paso 8
% Comprime el histograma de la imagen borrosa
I_blur_adj = imadjust(I_blur, stretchlim(I_blur), [0 0.4]);

%% Paso 9
% resta la imagen borrosa de la original
I_sharp = imsubtract(I,I_blur_adj);

%% Paso 10
% Estira el histograma de la imagen realzada al rango completo de la imagen
% de grises y muestra el resultado.
I_sharp_adj = imadjust(I_sharp);
subplot(1,3,3), imshow(I_sharp_adj), title('Imagen realzada');

%% Paso 11
% Resta la imagen borrosa de la original para generar una imagen en proceso
% de realce
I_sharpening = imsubtract(I,I_blur);

%% Paso 12
% Añade a la imagen en proceso de realce a la imagen original para obtener
% el resultado final.
I_sharp2 = imadd(I,I_sharpening);
figure, subplot(1,2,1), imshow(I), title('Imagen original');
subplot(1,2,2), imshow(I_sharp2), title('Imagen realzada');

%% Paso 13
% Genera un núcleo de unsharp masking 
f_unsharp = fspecial('unsharp');

%% Paso 14
% Aplica la máscara a la imagen original para crear la imagen realzada
I_sharp3 = imfilter(I,f_unsharp);
figure, subplot(1,2,1), imshow(I), title('Imagen Original');
subplot(1,2,2), imshow(I_sharp3), title('Imagen Realzada');

%% Paso 15
close all

%% Paso 16
% Crea una máscara high boost con A=1 y aplícala a la imagen moon.tif
f_hb = [0 -1 0; -1 5 -1; 0 -1 0];
I_sharp4 = imfilter(I,f_hb); 
figure, subplot(1,2,1), imshow(I), title('Image Original');
subplot(1,2,2), imshow(I_sharp4), title('Imagen Realzada');

%% Paso 17
% Muestra que una máscara de high boost con A=3 es similar a la imagen
% original simplemente multiplicada por 3
f_hb2 = [0 -1 0; -1 7 -1; 0 -1 0];
I_sharp5 = imfilter(I,f_hb2); 
I_mult = immultiply(I,3); 
figure, subplot(1,3,1), imshow(I), title('Imagen Original');
 subplot(1,3,2), imshow(I_sharp5), title('High Boost, A = 3');
 subplot(1,3,3), imshow(I_mult), title('Multiplicada por 3');