% GUIÓN 10.2: FILTROS DE AISLAMIENTO EN EL DOMINIO ESPACIAL

%% Paso 1
% Carga la imagen cameraman.tif y prepara los gráficos
I = imread('cameraman.tif');
figure, subplot(1,2,1), imshow(I), title('Imagen original');

%% Paso 2
% Crea un filtro de medias usando la función fspecial
fn = fspecial('average');

%% Paso 3
% Filtra la imagen cameraman.tif con la máscara generada
I_new = imfilter(I,fn);
subplot(1,2,2), imshow(I_new), title('Imagen filtrada');

%% Paso 4
% Crea una versión no uniforme del filtro de medias
fn2 = [1 2 1; 2 4 2; 1 2 1]
fn2 = fn2 * (1/16)

%% Paso 5
I_new2 = imfilter(I,fn2);
figure, subplot(1,2,1), imshow(I_new), title('Media uniforme');
subplot(1,2,2), imshow(I_new2), title('Media no uniforme');

%% Paso 6
% Crea un filtro guassiano y muestra el núcleo usando un gráfico 3D
fn_gau = fspecial('gaussian',9,1.5);
figure, bar3(fn_gau), title('Filtro Gaussiano como gráfico 3D');

%% Paso 7
% Filtra la imagen cameraman.tif usando la máscara gaussiana
I_new3 = imfilter(I,fn_gau);
figure
subplot(1,3,1), imshow(I), title('Imagen original');
subplot(1,3,2), imshow(I_new), title('Filtro de Medias');
subplot(1,3,3), imshow(I_new3), title('Filtro Gaussiano');