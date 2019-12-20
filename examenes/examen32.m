% Examen 2
%% Ejercicio 1
I_salt = im2double(imread('eight_salt.tif'));
I_pepper = im2double(imread('eight_pepper.tif'));
figure
subplot(2,3,1), imshow(I), title('Imagen original');
subplot(2,3,2), imshow(I_salt), title('Ruido de sal');
subplot(2,3,3), imshow(I_pepper), title('Ruido de Pimienta');

% Filtra el ruido de sal usando r=-1 en el filtro contra-armonico
I_fix1 = nlfilter(I_salt,[3 3],@c_harmonic,-1);
subplot(2,3,5), imshow(I_fix1), title('Sal eliminada, r=-1');

% Filtra el ruido de pimienta en la imagen usando r=1 en el filtro
% contra-armónico
I_fix2 = nlfilter(I_salt,[3 3],@c_harmonic,1);
subplot(2,3,6), imshow(I_fix2), title('Pimienta eliminada, r=1');
