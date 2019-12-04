% Gui�n 8.1 Transformaciones de los Niveles de Gris 
%% Paso 1
% Funci�n de identidad que no transforma nada
x = uint8(0:255);
plot(x); xlim([0 255]); ylim([0 255]);

%% Paso 2
% transformaci�n con la funci�n identidad
I = imread('moon.tif');
I_adj1 = intlut(I,x);
figure, subplot(1,2,1), imshow(I), title('Imagen Original');
subplot(1,2,2), imshow(I_adj1), title('Imagen Ajustada');

%% Paso 3
% Transformaci�n negativa
y = uint8(255:-1:0); 
I_neg = intlut(I,y);
figure, subplot(1,3,1), plot(y),
title('Funci�n de Transformaci�n'), xlim([0 255]), ylim([0 255]);
subplot(1,3,2), imshow(I), title('Imagen Original');
subplot(1,3,3), imshow(I_neg), title('Imagen Negativa');

%% Paso 4
% Complementa la imagen original y muestra que es equivalente a la imagen
% negativa generada en el paso anterior
I_cmp = imcomplement(I);
I_dif = imabsdiff(I_cmp,I_neg);
figure, imshow(I_cmp)
figure, imshow(I_dif,[])

%% Paso 5
close all
clear all

%% Pasos 6 y 7
x = 0:255; c= 255 / log(256);
y = c*log(x+1);
figure, subplot(2,2,1), plot(y),    
    title('Funci�n de transformaci�n logar�tmica'), axis tight, axis square
I = imread('radio.tif');
I_log = intlut(I,uint8(y));
subplot(2,2,2), imshow(I), title('Imagen Original');
subplot(2,2,3), imshow(I_log), title('Imagen Ajustada');   

%% Paso 8
I_br = imadd(I,100);
subplot(2,2,4), imshow(I_br), title('Imagen Original Escalada');

% �Por qu� la transformaci�n logar�tmica s� muestra los detalles de la
% imagen y la suma de un nivel de gris no?
% La transformaci�n logar�tmica mejora el rango din�mico de la imagen

%% Paso 9
y = exp(x/c) - 1;
I_invlog = intlut(I_log, uint8(y));
figure, subplot(2,1,1), plot(y), title('Funci�n Logaritmo-Inversa'); axis tight equal
subplot(2,1,2), imshow(I_invlog), title('Imagen Ajustada');

%% Paso 10
close all
clear all

%% Paso 11
% La potenciaci�n n-�sima y la ra�z n-�sima son transformaciones m�s
% vers�tiles que la funci�n log. El cambio de n te da m�s grados de
% libertad. Genera la funci�n ra�z n-�sima con n=2
x = 0:255; n=2; c= 255 / (255^n);
root = nthroot((x/c), n);
figure, subplot(2,2,1), plot(root),
    title('Funci�n Ra�z Cuadrada'), axis tight, axis square
    
%% Paso 12
% Usa esta transformaci�n para generar la imagen ajustada
I = imread('drill.tif');
I_root = intlut(I,uint8(root));
subplot(2,2,2), imshow(I), title('Imagen Original');
subplot(2,2,[3 4]), imshow(I_root), title('Imagen ra�z n-�sima');

%% Paso 13
% Genera una funci�n de transformaci�n n-�sima
power = c * ( x .^ n);
figure, subplot(1,2,1), plot(power), title('Transformaci�n Cuadr�tica');
axis tight, axis square

%% Paso 14
% Usa la transformaci�n potencia n-�sima para deshacer la transformaci�n
% anterior.
I_power = intlut(I_root,uint8(power));
subplot(1,2,2), imshow(I_power), title('Imagen ajustada');

%% Paso 15
close all
clear all

%% Paso 16
% Carga la imagen micro.tif y mu�strala
I = imread('micro.tif');
figure, subplot(1,3,1), imshow(I), title('Imagen original');

%% Paso 17
% Crea la funci�n de transformaci�n
y(1:175) = 0:174;
y(176:200) = 255;
y(201:256) = 200:255;
subplot(1,3,2), plot(y), axis tight, axis square

%% Paso 18
% Genera la imagen ajustada
I2 = intlut(I,uint8(y));
subplot(1,3,3), imshow(I2), title('Imagen ajustada');

%% Paso 19
% Crea una nueva funci�n de transformaci�n y muestra la imagen ajustada.
z(1:175) = 50;
z(176:200) = 255;
z(201:256) = 50;
I3 = intlut(I,uint8(z));
figure, subplot(1,2,1), plot(z), xlim([0 255]), ylim([0 255]), axis square
subplot(1,2,2), imshow(I3), title('Imagen ajustada');