% Examen 1
%% Ejercicio 1
% Leer imagen original y añadir ruido gaussiano
I = imread('eight.tif');
I_ruido = imnoise(I,'gaussian');
figure
subplot(2,2,1), imshow(I), title('Imagen Original');
subplot(2,2,2), imshow(I_ruido), title('Imagen con ruido');

% Crear un filtro de medias con tamaño por defecto 3x3
f1 = fspecial('average');
I_blur1 = imfilter(I,f1);
subplot(2,2,3), imshow(I_blur1), title('Promedio con tamaño núcleo por defecto');

% Crear un filtro de medias con tamaño 5x5
f2 = fspecial('average',[5 5]);
I_blur2 = imfilter(I,f2);
subplot(2,2,4), imshow(I_blur2),title('Promedio con tamaño núcleo 5x5');

%% Ejercicio 2
I = imread('cameraman.tif');
I = im2double(I);imshow(I);
[M, N] = size(I);

% Generamos un filtro de emborronamiento de tipo gaussiano
m=7; n=7;
h = fspecial('gaussian',[m n],3);

% Realizamos la convolución en el dominio espacial
Ib = imfilter(I,h,'circular','same');

% Reubicamos el filtro para calcular su transformada de Fourier
hext = padarray(h,[M-m N-n],0,'post');
horigen = circshift(hext, [-(m-1)/2 -(n-1)/2]);

% Realizamos ahora la convolución en el dominio de Fourier
fftIb = fft2(I).*fft2(horigen);

% Llevamos la convolución al dominio espacial
IbporFourier = real(ifft2(fftIb));

% Comprobamos que la convolución en el dominio espacial y cuando usamos
% transformada de Fourier coinciden y mostramos la imagen borrosa
max(abs(Ib(:)-IbporFourier(:)))
figure; imshow(Ib)

%% Ejercicio 3
I = imread('lenna.tif');
I_prwt = edge(I,'prewitt');
figure
subplot(2,2,1), imshow(I), title('Imagen Original');
subplot(2,2,2), imshow(I_prwt), title('Bordes extraidos');

I2 = imnoise(I,'gaussian');
I_prwt2 = edge(I2,'prewitt');
subplot(2,2,3), imshow(I2), title('Imagen ruidosa');
subplot(2,2,4), imshow(I_prwt2), title('Bordes extraidos de ruidosa');