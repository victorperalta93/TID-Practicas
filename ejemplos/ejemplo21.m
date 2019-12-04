% EJEMPLO 1
%% Ejercicio 1
% Lee la imagen moon.tif y realiza una transformación negativa de la misma.
% Comprueba que obtenemos el mismo resultado si usamos la función complemento.
% Dibuja en un gráfico con cuatro elementos la transformación,
% la imagen original, la transformada y las diferencias.
I=imread('moon.tif');
tr = 255:-1:0;
I_neg = intlut(I,uint8(tr));
I_diff = imsubtract(I,I_neg);
figure, subplot(2,2,1), imshow(I), title('Imagen original')
subplot(2,2,2), imshow(I_neg), title('Imagen modificada')
subplot(2,2,3), plot(tr), title('Transformación'), axis tight, axis square 
subplot(2,2,4), imshow(I_diff), title('Diferencia')

%% Ejercicio 2
I = imread('eight.tif');
figure, subplot(2,2,1), imshow(I), title('Imagen original')
subplot(2,2,2), imhist(I), title('Histograma original')
I_eq = histeq(I,256);
subplot(2,2,3), imshow(I_eq), title('Imagen ecualizada')
subplot(2,2,4), imhist(I_eq), title('Histograma ecualizado')

%% Ejercicio 3
a = [0 0 0 1 0 0 0]
f = [1 2 3 4 5]
g = imfilter(a,f,'full','conv')
% same indica que el vector de salida sea del mismo tamaño que el de
% entrada
% full indica que la salida sea el vector filtrado completo, por tanto
% mayor en tamaño que la entrada

%% Ejercicio 4
fn_gau = fspecial('gaussian',9,1.5);
figure, bar3(fn_gau,'b'), title('Filtro Gaussiano como gráfico 3D');
I = imread('cameraman.tif');
I_new3 = imfilter(I,fn_gau);
figure
subplot(1,2,1), imshow(I), title('Imagen original');
subplot(1,2,2), imshow(I_new3), title('Filtro Gaussiano');

%% Ejercicio 5
I = imread('cameraman.tif');
Id = im2double(I);
ft = fft2(Id);
ft_shift = fftshift(ft);
figure, subplot(1,2,1), imshow(abs(ft_shift),[]), title('mapeado directo');
subplot(1,2,2), imshow(log(1 + abs(ft_shift)),[]), title('Remap logaritmico');