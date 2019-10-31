% GUIÓN 4.2 MANIPULACIÓN BÁSICA DE IMÁGENES
I=imread('coins.png');

whos I

%% leer una imagen y almacenar su mapa de colores
[X,map] = imread('trees.tif');

%% convertir una imagen indexada a RGB
X_rgb=ind2rgb(X,map);

%% convertir una imagen indexada a escala de grises
X_gray=ind2gray(X,map);

%% para mostrar una imagen, utilizar imshow
imshow(X_rgb)

%% convertir la variable X_gray a clase double 
X_gray_dbl = im2double(X_gray);
max(X_gray_dbl(:)) % ans = 1

%% para ver informacion de pixeles al visualizar una imagen
imshow(I), impixelinfo

%% mostrar imagen indexada
imshow(X,map),impixelinfo

RGB=imread('peppers.png');

Imagen = imread('trees.tif');
[IM,Z] = imread('trees.tif');

%% improfile sirve para explorar el contenido de una línea de una imagen
r1 = 17;
c1 = 18;
r2 = 201;
c2 = 286;
imshow(I)
line([c1, c2], [r1, r2], 'Color', 'g', 'LineWidth', 2);
figure 
improfile(I, [c1, c2], [r1, r2]);
ylabel('Nivel de Gris'); xlabel('Distancia en el Perfil');

%% la forma más rica de mostrar una imagen es con imtool
imtool(X_rgb)

%% podemos mostrar varias imagenes en una figura utilizando subplot
A = imread('pout.tif');
B = imread('cameraman.tif');
figure 
subplot(1,2,1), imshow(A)
subplot(1,2,2), imshow(B)

%% si mostramos directamente imagenes con diferentes mapas de colores, no se muestran correctamente.
figure 
subplot(1,2,1), imshow(I) 
subplot(1,2,2), imshow(X,map)

%% podemos utilizar la función subimage para mostrar imágenes con diferentes mapas de colores
figure
subplot(1,2,1), subimage(I), axis off
subplot(1,2,2), subimage(X,map), axis off

%% convertir la imagen de intensidades coins.png (en I) a imagen indexada y luego a RGB
% I_ind contiene la imagen indexada 
% I_map contiene su mapa de colores
[I_ind, I_map] = gray2ind(I,256);
I_rgb = ind2rgb(I_ind,I_map);

%% ahora ya se puede mostrar la imagen directamente con subplot
figure
subplot(1,2,1), imshow(I_rgb)
subplot(1,2,2), imshow(X_rgb)

%% para guardar imagenes en archivos se utiliza imwrite
imwrite(X_rgb,'rgb_trees.jpg');
imwrite(X_gray,'gray_trees.jpg');