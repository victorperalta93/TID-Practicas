% EXAMEN 2
%% Ejercicio 1
x = 0:255; c= 255 / log(256);
y = c*log(x+1);
I = imread('radio.tif');
I_log = intlut(I,uint8(y));
figure, subplot(1,3,1), plot(y), axis tight, axis square
subplot(1,3,2), imshow(I), title('Imagen original')
subplot(1,3,3), imshow(I_log), title('Imagen transformada')

%% Ejercicio 2
I = imread('eight.tif');
figure, subplot(2,2,1), imshow(I), title('Imagen original')
tf = cumsum(I_hist);
tf_norm = tf / max(tf);
subplot(2,2,2), plot(tf_norm), axis tight