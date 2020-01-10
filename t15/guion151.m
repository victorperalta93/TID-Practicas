% GUIÓN 15: PROCESAMIENTO MORFOLÓGICO DE IMÁGENES BINARIAS

%% Paso 1
% Carga la imagen blobs.png y muéstrala
I = imread('blobs.png');
figure, imshow(I), title('Imagen Original');

%% Paso 2
% Crea un EE 3x3 con todos sus coeficientes iguales a 1.
SE_1 = strel('square',3);

%% Paso 3
% Realiza una dilatación usando este EE y muestra el resultado
I_dil_1 = imdilate(I,SE_1);
figure, imshow(I_dil_1), title('Dilatado con 3x3 de 1s');

%% Paso 4
% Veamos qué ocurre con otros EEs. Crea un EE 1x7 de 1s y dilata la imagen
% con él
SE_2 = strel('rectangle', [1 7]);
I_dil_2 = imdilate(I, SE_2);
figure, imshow(I_dil_2), title('Dilatada con EE 1x7 de 1s');

%% Paso 5
% Pasamos a hacer erosiones. Su cálculo es un proceso similar a la
% dilatación. Usaremos los EEs que ya tenemos.
I_ero_1 = imerode(I, SE_1);
figure, imshow(I), title('Imagen Original');
figure, imshow(I_ero_1), title('Erosionada con 3x3 de 1s');

%% Paso 6
% Erosiona ahora con el EE 1x7 antes definido.
I_ero_2 = imerode(I, SE_2);
figure, imshow(I_ero_2), title('Erosionado con 1x7 de 1s');

%% Paso 7
% Realiza la apertura con el EE 3x3 de 1s creado previamente
I_open_1 = imopen(I, SE_1);
figure, imshow(I), title('Imagen Original');
figure, imshow(I_open_1); title('Apertura de la Imagen con EE 3x3 de 1s');

%% Paso 8
% Compara apertura y erosión
figure, subplot(2,2,1), imshow(I), title('Imagen original');
subplot(2,2,2), imshow(I_ero_1), title('Resultado de la erosión 3x3');
subplot(2,2,3), imshow(I_open_1), title('Resultado de la apertura 3x3');
I_diff = imsubtract(I_ero_1,I_open_1);
subplot(2,2,4), imshow(I_diff), title('Diferencia de Erosión y Apertura');

%% Paso 9
% Realiza la apertura de la imagen con un EE 1x7
I_open_2 = imopen(I,SE_2);
subplot(2,2,4), imshow(I_open_2), title('Resultado de apertura 1x7');

%% Paso 10
% Crea un cuadrado 5x5 de 1s como EE y realiza la clausura
SE_3 = strel('square',5);
I_clo_1 = imclose(I,SE_3);
figure, imshow(I), title('Imagen Original');
figure, imshow(I_clo_1), title('Clausura de la imagen con 5x5 de 1s');

%% Paso 11
% Compara clausura y dilatación
figure, imshow(I), title('Imagen Original');
figure, imshow(I_dil_1), title('Dilatación de la imagen');
figure, imshow(I_clo_1), title('Clausura de la Imagen');

%% Paso 12
% Pasamos ahora a la transformación HoM. Primero cerramos las imagenes.
close all

%% Paso 13
% Define dos elementos estructurales
SE1 = [ 0 0 0 0 0 
    0 0 0 0 0
    0 1 1 0 0
    0 0 1 0 0
    0 0 0 0 0];

SE2 = [ 0 0 0 0 0
    1 1 1 1 0
    0 0 0 1 0
    0 0 0 1 0
    0 0 0 1 0];

%% Paso 14
% Aplica HoM a la imagen original
I_hm = bwhitmiss(I,SE1,SE2);
figure, imshow(I), title('Imagen Original');
figure, imshow(I_hm), title('Operación Hit-or-miss');

%% Paso 15 
% bwhitmiss puede incluir en una matriz los dos elementos estructurales,
% siempre que ambos no tengan elementos en común. Para ello se le asignan
% 1s a los píxeles del EE del hit y -1 a los del miss y luego llama a la
% función bwhitmiss
interval = [ 0 0 0 0 0 
    -1 -1 -1 -1 0
    0 1 1 -1 0
    0 0 1 -1 0
    0 0 0 -1 0];
I_hm2 = bwhitmiss(I,interval); 
figure, imshow(I_hm), title('Usando dos EEs'); 
figure, imshow(I_hm2), title('Usando invervalo');