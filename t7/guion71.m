% GUIÓN 7.1 Cropping, Resizing, Flipping y Rotación
%% Paso 1
I = imread('cameraman.tif');
imtool(I)

%% Paso 2
I2 = imread('cropped_building.png');
imshow(I2)

%% Paso 7
x1 = 179; x2 = 219; y1 = 80; y2 = 181;
xmin = x1; ymin = y1; anchura = x2-x1; altura = y2-y1;
I3 = imcrop(I, [xmin ymin anchura altura]); 
imshow(I3)

%% Paso 8
I_big1 = imresize(I,3);
figure, imshow(I), title('Imagen Original'); 
figure, imshow(I_big1), title('Imagen interpolada x3 con interpolación bicúbica');

%% Paso 9
imtool(I_big1)

%% Paso 10
I_big2 = imresize(I,3,'nearest');
I_big3 = imresize(I,3,'bilinear');
figure, imshow(I_big2), title('x3 con vecino más próximo'); 
figure, imshow(I_big3), title('x3 con interpolación bilineal');

%% Paso 12
I_rows = size(I,1); 
I_cols = size(I,2); 
I_sm1 = I(1:2:I_rows, 1:2:I_cols); 
figure, imshow(I_sm1);

%% Paso 13
I_sm2 = imresize(I,0.5,'nearest');
I_sm3 = imresize(I,0.5,'bilinear');
I_sm4 = imresize(I,0.5,'bicubic'); 
figure, subplot(1,3,1), imshow(I_sm2), title('Vecino más próximo'); 
subplot(1,3,2), imshow(I_sm3), title('Bilineal'); 
subplot(1,3,3), imshow(I_sm4), title('Bicubica');

%% Paso 16
I = imread('cameraman.tif'); 
J = flipud(I); 
K = fliplr(I); 
subplot(1,3,1), imshow(I), title('Imagen Original') 
subplot(1,3,2), imshow(J), title('Arriba-Abajo')
subplot(1,3,3), imshow(K), title('Izquierda-derecha')

%% Paso 18
I = imread('eight.tif'); 
I_rot = imrotate(I,35); 
imshow(I_rot);

%% Paso 19
I_rot2 = imrotate(I,35,'bilinear');
figure, imshow(I_rot2)

%% Paso 20
I_rot3 = imrotate(I,35,'bilinear','crop');
figure, imshow(I_rot3)