% EJEMPLO 1

%% Ejercicio 1
% Carga  la  imagen  blobs.png  y  muéstrala.  
I = imread('blobs.png');
figure, imshow(I);

% Crea  un  elemento  estructural  3x3  con  todos  sus coeficientes iguales a 1. 
st = strel('square',3);

% Realiza y explica que va a ocurrir cuando hacemos una dilatación con dicho elemento estructural.
b = imdilate(I,st);

% Dibuja el resultado
figure, imshow(b);

%% Ejercicio 2
% Carga y muestra la imagen morph.bpm. Quita a la imagen original su versión erosionada y muéstrala
I = imread('morph.bmp');
figure, imshow(I);
c = imerode(I,st);
I2 = imsubtract(I,c);
figure, imshow(I2);

%% Ejercicio 3
% Antes   de   realizar   blockmatchingexhaustivo,   definiremos   las   variables   necesarias. 
% Definiremos  el  fotograma  de  anclado,  el  fotograma  objetivo,  las  dimensiones  de  
% los fotogramas, el tamaño del bloque, el rango de búsqueda (p) y finalmente la precisión (1). 
anchorName = 'foreman69.Y'; 
targetName = 'foreman72.Y'; 
frameHeight = 352; 
frameWidth = 288; 
blockSize = [16,16]; 
p = 16; 
accuracy = 1;
% A continuación   leemos   los   datos fotograma.
fid = fopen(anchorName,'r'); 
anchorFrame= fread(fid,[frameHeight,frameWidth]);
anchorFrame = anchorFrame';
fclose(fid); 
fid = fopen(targetName,'r');
targetFrame = fread(fid,[frameHeight,frameWidth]);
targetFrame = targetFrame'; 
fclose(fid);
% Ejecuta   la   función   ebmn.
tic 
[predictedFrame_Full, mv_d, mv_o] = ebma(targetFrame, anchorFrame, blockSize, p, accuracy);
time_full = toc;
% Muestra   los fotogramas de anclado y objetivo. 
figure 
subplot(1,2,1), imshow(uint8(anchorFrame)), title('Anchor Frame'); 
subplot(1,2,2), imshow(uint8(targetFrame)), title('Target Frame');
% Muestra los vectores de movimiento sobre el fotograma de anclado. 
figure, imshow(uint8(anchorFrame)) 
hold on 
quiver(mv_o(1,:),mv_o(2,:),mv_d(1,:),mv_d(2,:)), title('Motion vectors: EBMA - Integer-pixel'); 
hold off
% Muestra el fotograma predicción
figure, imshow(uint8(predictedFrame_Full)), title('Predicted Frame Full-pixel');