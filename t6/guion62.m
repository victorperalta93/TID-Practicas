% GUIÓN 6.2 : Operaciones Lógicas y Procesamiento de Regiones de Interés (ROI)
%% Paso 1
doc roipoly

%% Paso 2
I = imread('pout.tif');
bw = roipoly(I)

%% Paso 3
bw2 = im2uint8(bw);

%% Paso 4
I2 = bitand(I,bw2);

%% Paso 5
bw_cmp = bitcmp(bw2);
figure
subplot(1,2,1), imshow(bw2), title('Máscara Original');
subplot(1,2,2), imshow(bw_cmp), title('Máscara Complemento');

%% Paso 6
I3 = bitor(I,bw_cmp);
figure, imshow(I3);

%% Paso 7
bw_cmp2 = imcomplement(bw2);

%% Paso 9
I = imread('cameraman.tif');
I2 = imread('cameraman2.tif');
I_xor = bitxor(I,I2);
figure
subplot(1,3,1), imshow(I), title('Imagen 1');
subplot(1,3,2), imshow(I2), title('Imagen 2');
subplot(1,3,3), imshow(I_xor,[]), title('Imagen XOR');

%% Paso 11
I = imread('lindsay.tif');
I_adj = imdivide(I,1.5);

%% Paso 12
bw = im2uint8(roipoly(I));

%% Paso 13
bw_cmp = bitcmp(bw); %máscara complementaria
roi = bitor(I_adj,bw_cmp); %roi
not_roi = bitor(I,bw); %non_roi
new_img = bitand(roi,not_roi); %genera la imagen nueva
imshow(new_img) %muestra la nueva imagen