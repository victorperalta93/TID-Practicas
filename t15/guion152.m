% GUIÓN 15.2: ALGORITMOS MORFOLÓGICOS BÁSICOS

%% Paso 1
% Carga y muestra la imagen de test.
I = imread('morph.bmp');
figure, imshow(I), title('Imagen Original');

%% Paso 2
% Quita a la imagen original su versión erosionada para obtener la frontera
se = strel('square',3);
I_ero = imerode(I,se);
I_bou = imsubtract(I,I_ero);
figure, imshow(I_bou), title('Extracción de Fronteras');

%% Paso 3
% Usa ahora la función bwperim para extrar la frontera
I_perim = bwperim(I,8);
figure, imshow(I_perim), title('Frontera usando bwperim');

%% Paso 4
close all

%% Paso 5
% Rellena los huecos de una imagen usando la función imfill
I_fill1 = imfill(I,'holes');
figure, imshow(I_fill1), title('Huecos rellenos');

%% Paso 6
% La función imfill puede usarse de forma interactiva. Selecciona dos de
% los tres huecos. Tras seleccionar los puntos presiona enter
I_fill2=imfill(I);
imshow(I_fill2), title('Relleno interactivo');

%% Paso 7
close all

%% Paso 8
% Selecciona cualquiera de los objetos en blanco y presiona Enter.
bwselect(I);

%% Paso 9
% En muchas situaciones necesitaremos etiquetar componentes conectadas.
% Podemos utilizar la función bwlabel
I_label = bwlabel(I);
figure ,imshow(I_label,[]), title('Imagen etiquetada');

%% Paso 10
% Usa la función _bwmorph_ para adelgazar la imagen original con 5
% iteraciones
I_thin = bwmorph(I,'thin',5);
figure, imshow(I_thin), title('Adelgazamiento con 5 iteraciones');

%% Paso 11
% Engorda la imagen original durante 5 iteraciones
I_thick = bwmorph(I,'thicken',5);
figure, imshow(I_thick), title('Thicken, 5 iteraciones');

%% Paso 12
close all

%% Paso 13
% Genera el esqueleto usando la función bwmorph
I_skel = bwmorph(I,'skel',Inf);
figure, imshow(I_skel), title('Esqueleto de una imagen');