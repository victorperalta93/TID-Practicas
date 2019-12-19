% GUIÓN 12.2: ELIMINACIÓN DE EMBORRONAMIENTO

%% Paso 1
% Carga la imagen cameraman.tif y muestrala
I = imread('cameraman.tif');
I = im2double(I);imshow(I);
[M, N] = size(I);

%% Paso 2
% Generamos un filtro de emborronamiento de tipo gaussiano
m=7; n=7;
h = fspecial('gaussian',[m n],3);

%% Paso 3
% Realizamos la convolución en el dominio espacial
Ib = imfilter(I,h,'circular','same');

%% Paso 4
% Reubicamos el filtro para calcular su transformada de Fourier
hext = padarray(h,[M-m N-n],0,'post');
horigen = circshift(hext, [-(m-1)/2 -(n-1)/2]);

%% Paso 5
% Realizamos ahora la convolución en el dominio de Fourier
fftIb = fft2(I).*fft2(horigen);

%% Paso 6
% Llevamos la convolución al dominio espacial
IbporFourier = real(ifft2(fftIb));

%% Paso 7
% Comprobamos que la convolución en el dominio espacial y cuando usamos
% transformada de Fourier coinciden y mostramos la imagen borrosa
max(abs(Ib(:)-IbporFourier(:)))
figure; imshow(Ib)
imwrite(Ib,'imagenborrosa.png');

%% Paso 8
% A continuación le vamos a añadir ruido a la imagen borrosa y la vamos a
% mostrar
Ib=im2double(Ib); imshow(Ib);
noise_desv=0.0001;
Ibr=imnoise(Ib,'gaussian',0,noise_desv);
figure; imshow(Ibr);

%% Paso 10
% A continuación vamos a restaurar la imagen borrosa y la borrosa con ruido 
% suponiendo que conocemos la función de emborronamiento y por tanto su 
% transformada de Fourier. Vamos a usar la transformada de Fourier del 
% emborronamiento que conocemos del paso 4.
FTIb=fft2(Ib);
FTh= fft2(horigen);
lambda=0.0001;
FTrestaurada=(conj(FTh).*FTIb)./(conj(FTh).*FTh +lambda);
restauracion=real(ifft2(FTrestaurada));
figure; imshow(restauracion)

%% Paso 11
% Vamos a realizar el mismo proceso pero con la imagen borrosa y ruidosa
FTIbr=fft2(Ibr);
FTh= fft2(horigen);

lambda=0.01;
FTrestaurada=(conj(FTh).*FTIbr)./(conj(FTh).*FTh +lambda); 
restauracion=real(ifft2(FTrestaurada));
figure; imshow(restauracion)