% GUIÓN 4.2 MANIPULACIÓN BÁSICA DE IMÁGENES
I=imread('coins.png');

whos I

% leer una imagen y almacenar su mapa de colores
[X,map] = imread('trees.tif');

% convertir una imagen indexada a RGB
X_rgb=ind2rgb(X,map);

% convertir una imagen indexada a escala de grises
X_gray=ind2gray(X,map);

% para mostrar una imagen, utilizar imshow
imshow(X_rgb)

% convertir la variable X_gray a clase double 
X_gray_dbl = im2double(X_gray);
max(X_gray_dbl(:)) % ans = 1

% para ver informacion de pixeles al visualizar una imagen
imshow(I), impixelinfo

% mostrar imagen indexada
imshow(X,map),impixelinfo

RGB=imread('peppers.png');