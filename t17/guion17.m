% GUI�N 17: ESTIMACI�N DE MOVIMIENTO BASADA EN BLOQUES (EMBB)

%% Paso 1
% Antes de realizar blockmatching exhaustivo, definiremos las variables
% necesarias. Definiremos el fotograma de anclado, el fotograma objetivo,
% las dimensiones de los fotogramas, el tama�o del bloque, el rango de
% b�squeda(p) y finalmente la precisi�n (1 para pixel entero y 2 para
% medio-pixel)
anchorName = 'foreman69.Y';
targetName = 'foreman72.Y';
frameHeight = 352;
frameWidth = 288;
blockSize = [16,16];
p = 16;
accuracy = 1;

%% Paso 2
% A continuaci�n leemos los datos del fotograma
fid = fopen(anchorName,'r');
anchorFrame = fread(fid,[frameHeight,frameWidth]);
anchorFrame = anchorFrame';
fclose(fid);
fid = fopen(targetName,'r');
targetFrame = fread(fid,[frameHeight,frameWidth]);
targetFrame = targetFrame';
fclose(fid);

%% Paso 3
% Ejecuta la funci�n ebmn y guarda el tiempo de procesamiento en la
% variable time_full
tic
[predictedFrame_Full, mv_d, mv_o] = ebma(targetFrame, anchorFrame, blockSize, p, accuracy);
time_full = toc;

%% Paso 4
% Muestra los fotogramas de anclado y objetivo
figure
subplot(1,2,1), imshow(uint8(anchorFrame)), title('Fotograma de anclado');
subplot(1,2,2), imshow(uint8(targetFrame)), title('Fotograma objetivo');

%% Paso 5
% Muestra los vectores de movimiento sobre el fotograma de anclado
figure, imshow(uint8(anchorFrame))
hold on
quiver(mv_o(1,:), mv_o(2,:), mv_d(1,:), mv_d(2,:)),
title('Motion vectors: EBMA - Integer-pixel');
hold off

%% Paso 6
% Muestra el fotograma predicci�n
figure, imshow(uint8(predictedFrame_Full)),
title('Predicted Frame Full-pixel');

%% Paso 7
% Calcula el fotograma error restando el fotograma predicci�n del fotograma
% de anclado y mu�stralo. Calcula tambi�n el error en valor absoluto
imshow(anchorFrame-predictedFrame_Full,[]);
errorFrame = imabsdiff(anchorFrame, predictedFrame_Full);

%% Paso 8
% Calcula el PSNR utilizando la f�rmula siguiente
PSNR_Full = 10*log10(255*255/mean(mean((errorFrame.^2))));

%% Paso 9
% Vamos ahora a analizar la estimaci�n de movimiento subpixel. Primero
% aumentaremos el tama�o del fotograma
targetFrame2 = imresize(targetFrame,2,'bilinear');

%% Paso 10
% Inicializamos la precisi�n a subpixel
accuracy=2;

%% Paso 11
% Ejecuta EBMA con precisi�n subp�xel y calcula el tiempo de ejecuci�n
tic
[predictedFrame_Half, mv_d, mv_o] = ebma(targetFrame2,anchorFrame,blockSize,p,accuracy);
time_half = toc;

%% Paso 12
% Compara los tiempos de ejecuci�n entre la estimaci�n de movimiento entera
% y medio-pixel
time_half
time_full

%% Paso 13
% Muestra los vectores de movimiento sobre el fotograma de anclado
figure, imshow(uint8(anchorFrame)), hold on
quiver(mv_o(1,:),mv_o(2,:),mv_d(1,:),mv_d(2,:)),
title('Motion vectors: EBMA - Half-pixel');
hold off

%% Paso 14
% Muestra el fotograma predicci�n
figure, imshow(uint8(predictedFrame_Half)),
title('Predicted Frame Half-pixel');

%% Paso 15
% Calcula el fotograma error absoluto y muestra el error
errorFrame = imabsdiff(anchorFrame, predictedFrame_Half);
figure; imshow(errorFrame,[]);

%% Paso 16
% Calcula el PSNR
PSNR_Half = 10*log10(255*255/mean(mean((errorFrame.^2))));

%% Paso 17
% Para empezar a implementar la estimaci�n de movimiento por bloques
% jerarquica (HBMA) tenemos que definir primero algunas variables. Aqu�
% definiremos los nombres de los fotogramas que vamos a leer, sus
% dimensiones, tama�o de bloque, rangos, precisi�n y el n�mero de niveles
% que vamos a procesar (en nuestro caso 3). Definimos las variables que
% necesitamos para ejecutar HBMA
anchorName = 'foreman69.Y'; 
targetName = 'foreman72.Y'; 
frameHeight = 352; 
frameWidth = 288; 
blockSize = [16,16]; 
rangs = [-32,-32]; 
range = [32,32];
accuracy = 1;
L = 3;

%% Paso 18
% Lee los fotogramas
fid = fopen(anchorName,'r');
anchorFrame= fread(fid,[frameHeight,frameWidth]);
fclose(fid);
fid = fopen(targetName,'r');
targetFrame = fread(fid,[frameHeight,frameWidth]);
fclose(fid);

%% Paso 19
% ejecuta hbma y guarda el tiempo de ejecuci�n necesario
tic 
[predict,mv_d,mv_o] = hbma(targetFrame, anchorFrame, blockSize, rangs, range, accuracy, L);
time_hierarchical=toc;

%% Paso 20
% Muestra los fotogramas de anclado y objetivo para poderlos comparar con
% la predicci�n
figure 
subplot(1,2,1), imshow(uint8(anchorFrame')), title('Anchor Frame'); 
subplot(1,2,2), imshow(uint8(targetFrame')), title('Target Frame');

%% Paso 21
% Muestra los vectores de movimiento sobre el fotograma de anclado
figure, imshow(uint8(anchorFrame'))
hold on 
quiver(mv_o(2,:),mv_o(1,:),mv_d(2,:),mv_d(1,:)),
title('Motion vectors');
hold off

%% Paso 22
% Muestra el fotograma predicci�n
figure, imshow(uint8(predict')),
title('Predicted Frame');

%% Paso 23
% Muestra el error entre los fotogramas y el PSNR
imshow(anchorFrame'-predict',[]);
PSNR_Hierarchical=10*log10(255*255/mean(mean((errorFrame.^2))));