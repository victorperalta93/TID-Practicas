% GUIÓN 7.1 Cropping, Resizing, Flipping y Rotación

%% Paso 1
% Muestra una imagen y su histograma
I = imread('circuit.tif');
figure, subplot(2,2,1), imshow(I), title('Imagen')
subplot(2,2,2), imhist(I,256), axis tight, title('Histograma')

%% Paso 2
% El paso anterior mostró el histograma con 256 niveles de gris.
% Veamos que ocurre si cambiamos a 64 y 32 bins (cajas).
subplot(2,2,3), imhist(I,64), axis tight
title('Histograma con 64 bins')
subplot(2,2,4), imhist(I,32), axis tight,
title('Histograma con 32 bins')

%% Paso 3
% Guarda los valores en cada bin para uso posterior
c = imhist(I,32);

%% Paso 4
% Normaliza los valores en c
% numel calcula en número de elementos en un array
c_norm = c / numel(I);

%% Paso 5
close all

%% Paso 6
% Muestra el histograma utilizando un diagrama de barras.
% Observa como bar_1 es asignado el objeto diagrama de barras.
figure, subplot(1,2,1), bar_1 = bar(c);
set(gca, 'XLim', [0 32], 'YLim', [0 max(c)]);

%% Paso 7
% Incluye las marcas para indicar los límites en X e Y.
% gca indica get current axes
set(gca, 'XTick', (0:8:32), 'YTick', [linspace(0,7000,8) max(c)]);

%% Paso 8
% Utiliza la función set para cambiar el color del diagrama 
% e incluir el titulo
set(bar_1, 'FaceColor', 'r'), title('Diagrama de Barras')

%% Paso 9
% Muestra el diagrama de barras normalizado y modifica su apariencia
subplot(1,2,2), bar_2 = bar(c_norm);
set(gca, 'XTick', 0:8:32, 'YTick',[linspace(0,0.09,10) max(c_norm)])
xlim([0 32]), ylim([0 max(c_norm)])
title('Diagrama de barras normalizado')
set(bar_2,'FaceColor','g')

%% Paso 10
close all

%% Paso 11
% Muestra un gráfico tipo stem para los histogramas normalizados
% y no normalizados
figure,
subplot(1,2,1), stem(c,'fill','MarkerFaceColor','red'),
axis tight, title('Diagrama')
subplot(1,2,2), stem(c_norm,'fill','MarkerFaceColor','red'),
axis tight, title('Diagrama Normalizado')

%% Paso 12
% Muestra un gráfico para los histogramas normalizado y no normalizado
% usando la función plot.
figure, subplot(1,2,1), plot(c), axis auto, title('Gráfico')
subplot(1,2,2), plot(c_norm), axis auto,
title('Gráfico Normalizado')




