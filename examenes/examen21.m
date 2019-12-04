% EXAMEN 1
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