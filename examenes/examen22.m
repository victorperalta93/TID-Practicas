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

%% Ejercicio 3
a = [0 0 0 1 0 0 0]
f = [1 2 3 4 5]
g = imfilter(a,f,'full','corr')
% same indica que el vector de salida sea del mismo tamaño que el de
% entrada
% full indica que la salida sea el vector filtrado completo, por tanto
% mayor en tamaño que la entrada

%% Ejercicio 4
fn_gau = fspecial('gaussian',9,1.5);
figure, bar3(fn_gau,'b'), title('Filtro Gaussiano como gráfico 3D');
I = imread('cameraman.tif');
I_new3 = imfilter(I,fn_gau);
figure
subplot(1,2,1), imshow(I), title('Imagen original');
subplot(1,2,2), imshow(I_new3), title('Filtro Gaussiano');