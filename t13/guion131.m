% GUIÓN 13.1: DETECCIÓN DE FRONTERAS

%% Paso 1
% Carga y muestra la imagen test
I = imread('lenna.tif');
figure, subplot(2,2,1), imshow(I), title('Imagen Original');

%% Paso 2
% Extrae los bordes de la imagen usando el operador de Prewitt
[I_prw1,t1] = edge(I,'prewitt'); 
subplot(2,2,2), imshow(I_prw1), title('Prewitt, umbral por defecto');

%% Paso 3
% Añade ruido a la imagen y extrae sus bordes
I_noise = imnoise(I,'gaussian');
[I_prw2,t2] = edge(I_noise,'prewitt'); 
subplot(2,2,3), imshow(I_noise), title('Imagen con ruido');
subplot(2,2,4), imshow(I_prw2), title('Prewitt sobre ruido');

%% Paso 4
% Pasemos ahora a analizar el operador de Sobel. Extrae las fronteras de la
% imagen de lenna utilizando el operador de Sobel
[I_sob1,t1] = edge(I,'sobel');
figure, subplot(2,2,1), imshow(I), title('Imagen original'); 
subplot(2,2,2), imshow(I_sob1), title('Sobel, umbral por defecto');

%% Paso 5
% Extrae los bordes de la imagen test con ruido gaussiano usando el
% detector de Sobel
[I_sob2,t2] = edge(I_noise,'sobel');
subplot(2,2,3), imshow(I_noise), title('Imagen con ruido');
subplot(2,2,4), imshow(I_sob2), title('Sobel con ruido');

%% Paso 6
% Un rasgo de la función edge es thinning que reduce la anchura de los
% bordes detectados. Por defecto se aplica cuando utilizamos edge, aunque
% puede deshabilitarse. Extrae los bordes de la imagen de test con el
% operador de Sobel sin thinning.
I_sob3 = edge(I,'sobel','nothinning'); 
figure, subplot(1,2,1), imshow(I_sob1), title('Thinning');
subplot(1,2,2), imshow(I_sob3), title('Sin thinning');

%% Paso 7
% Como sabes, el operador de Sobel realiza dos convoluciones (horizontal y
% vertical). Estas imagenes pueden obtenerse utilizando parámetros de
% salida adicionales. Muestra los resultados de las convoluciones
% horizontal y vertical usando el operador de Sobel.
[I_sob4,t,I_sobv,I_sobh] = edge(I,'sobel'); 
figure 
subplot(2,2,1), imshow(I), title('Imagen Original'); 
subplot(2,2,2), imshow(I_sob4), title('Sobel completo'); 
subplot(2,2,3), imshow(abs(I_sobv),[]), title('Sobel Vertical'); 
subplot(2,2,4), imshow(abs(I_sobh),[]), title('Sobel Horizontal');

%% Paso 8
% Vamos ahora a trabajar con el detector de Roberts. Extrae los bordes de
% la imagen original usando el detector de Roberts.
I_rob1 = edge(I,'roberts'); 
figure 
subplot(2,2,1), imshow(I), title('Imagen Original'); 
subplot(2,2,2), imshow(I_rob1), title('Roberts, umbral por defecto');

%% Paso 9
% Aplica el operador de Roberts a una imagen ruidosa
[I_rob2,t] = edge(I_noise,'roberts'); 
subplot(2,2,3), imshow(I_noise), title('Imagen con ruido'); 
subplot(2,2,4), imshow(I_rob2), title('Roberts sobre ruidosa');

%% Paso 10
% Vamos ahora a utilizar LoG para detectar bordes. Está tambien incluida en
% la función edge. Extrae los bordes de la imagen original usando LoG
I_log1 = edge(I,'log'); 
figure
subplot(2,2,1), imshow(I), title('Original Imagen Original');
subplot(2,2,2), imshow(I_log1), title('LoG, parámetros por defecto');

%% Paso 11
% Aplica ahora el detector LoG a una imagen ruidosa
[I_log2,t] = edge(I_noise,'log'); 
subplot(2,2,3), imshow(I_noise), title('Imagen con ruido');
subplot(2,2,4), imshow(I_log2), title('LoG sobre ruido');

%% Paso 12
% Vamos ahora a estudiar el detector de Canny. Utilizalo para extraer los
% bordes de una imagen
I_can1 = edge(I,'canny');
figure 
subplot(2,2,1), imshow(I), title('Imagen Original'); 
subplot(2,2,2), imshow(I_log1), title('Canny, valores por defecto');

%% Paso 13
[I_can2,t] = edge(I_noise,'canny', [], 2.5); 
subplot(2,2,3), imshow(I_noise), title('Imagen con ruido');
subplot(2,2,4), imshow(I_can2), title('Canny sobre ruido');

%% Paso 14
% Aplica el detector de canny sobre la imagen ruidosa con sigma=2
[I_can3,t] = edge(I_noise,'canny', [], 2); 
figure 
subplot(1,2,1), imshow(I_can2), title('Canny, parámetros por defecto'); 
subplot(1,2,2), imshow(I_can3), title('Canny, sigma = 2');

%% Paso 15
% Otra opción del detector de fronteras de Canny es la modificación del
% umbral. Cierra todas las figuras y limpia el espacio de trabajo
close all;
clear all;

%% Paso 16
% Carga la imagen mandril.tif y realiza Canny con las opciones por defecto
I = imread('mandrill.tif');
[I_can1,thresh] = edge(I,'canny');
figure 
subplot(2,2,1), imshow(I), title('Imagen original');
subplot(2,2,2), imshow(I_can1), title('Canny, parámetros por defecto');

%% Paso 18
% Utiliza un umbral mayor que thresh
[I_can2,thresh] = edge(I, 'canny', 0.4);
subplot(2,2,3), imshow(I_can2), title('Canny, umbral = 0.4');

%% Paso 19
% Utiliza un umbral menor que thresh
[I_can2,thresh] = edge(I, 'canny', 0.08); 
subplot(2,2,4), imshow(I_can2), title('Canny, umbral = 0.08');

%% Paso 20
% Vamos ahora a analizar el detector de Kirsch que no está incluido en la
% IPT. Cierra todas las imagenes y libera el espacio de trabajo
close all;
clear;

%% Paso 21
% Carga la imagen del mandril y conviertela en double
I = imread('mandrill.tif');
I = im2double(I);

%% Paso 22
% Crea las máscaras de Kirsch y almacénalas
k = zeros(3,3,8);
k(:,:,1) = [-3 -3 5; -3 0 5; -3 -3 5];
k(:,:,2) = [-3 5 5; -3 0 5; -3 -3 -3];
k(:,:,3) = [5 5 5; -3 0 -3; -3 -3 -3];
k(:,:,4) = [5 5 -3; 5 0 -3; -3 -3 -3];
k(:,:,5) = [5 -3 -3; 5 0 -3; 5 -3 -3];
k(:,:,6) = [-3 -3 -3; 5 0 -3; 5 5 -3];
k(:,:,7) = [-3 -3 -3; -3 0 -3; 5 5 5];
k(:,:,8) = [-3 -3 -3; -3 0 5; -3 5 5];

%% Paso 23
% Convoluciona cada máscara con la imagen utilizando for
I_k = zeros(size(I,1), size(I,2), 8);
for i = 1:8 
    I_k(:,:,i) = imfilter(I,k(:,:,i)); 
end

%% Paso 24
% Muestra las imagenes resultantes
figure 
for j = 1:8
    subplot(2,4,j), imshow(abs(I_k(:,:,j)),[]),
    title(['Máscara de Kirsch ', num2str(j)]); 
end

%% Paso 25
% Encuentra los valores máximos
I_kir = max(I_k,[],3); 
figure, imshow(I_kir,[]);

%% Paso 26
% Crea una transformación lineal que transforma la imagen a una de niveles
% de gris y realiza la transformación
minimo= min(I_kir(:));
m = 255 / (max(I_kir(:)) - minimo);
I_kir_adj = uint8(m * (I_kir-minimo));
figure, imshow(I_kir_adj);

%% Paso 27
% Genera las máscaras de Robinson
r = zeros(3,3,8);
r(:,:,1) = [-1 0 1; -2 0 2; -1 0 1];
r(:,:,2) = [0 1 2; -1 0 1; -2 -1 0];
r(:,:,3) = [1 2 1; 0 0 0; -1 -2 -1];
r(:,:,4) = [2 1 0; 1 0 -1; 0 -1 -2];
r(:,:,5) = [1 0 -1; 2 0 -2; 1 0 -1];
r(:,:,6) = [0 -1 -2; 1 0 -1; 2 1 0];
r(:,:,7) = [-1 -2 -1; 0 0 0; 1 2 1];
r(:,:,8) = [-2 -1 0; -1 0 1; 0 1 2];

%% Paso 28
% Filtra la imagen con las ocho máscaras de Robinson y muestra la salida
I_r = zeros(size(I,1), size(I,2), 8);
for i = 1:8
    I_r(:,:,i) = imfilter(I,r(:,:,i));
end
figure 
for j = 1:8
    subplot(2,4,j), imshow(abs(I_r(:,:,j)),[]), 
    title(['Máscara de Robinson ', num2str(j)]);
end

%% Paso 29
% Calcula el máximo de las ocho imágenes y muestra el resultado
I_rob = max(I_r,[],3); 
figure, imshow(I_kir,[]);

%% Paso 30
% Vamos a terminar el guion realizando un ejemplo muy sencillo de detección
% de esquinas.
close all;
clear;

%% Paso 31
% Genera una imagen de reales de un cuadrado blanco sobre fondo negro y
% muestra la imagen
I=zeros(256);
I(80:170,80:170)=1; 
subplot(2,2,1), imshow(I), title('Imagen original')

%% Paso 32
% Calcula sus fronteras y las imágenes de derivadas horizontales y
% verticales. Dibújalas.
[I_sob4,t,I_sobv,I_sobh] = edge(I,'sobel'); 
subplot(2,2,2), imshow(I_sob4), title('Sobel, Umbral automático')
subplot(2,2,3), imshow(abs(I_sobv),[]), title('Sobel, derivadas verticales') 
subplot(2,2,4), imshow(abs(I_sobh),[]), title('Sobel, derivadas horizontales')

%% Paso 33 
% Empezemos a calcular la matriz de Harris para detectar esquinas en cada
% pixel.
I_sobv2=I_sobv.*I_sobv;
I_sobh2=I_sobh.*I_sobh;
I_sobvh=I_sobv.*I_sobh;

%% Paso 34
% Filtra cada una de estas tres imágenes con un filtro de unos de tamaño
% 3x3.
I_sobv2m=imfilter(I_sobv2,ones(3));
I_sobh2m= imfilter(I_sobh2,ones(3));
I_sobvhm= imfilter(I_sobvh,ones(3));

%% Paso 35
% Calcula para cada pixel el mínimo valor de la matriz de Harris para
% detectar esquinas
I_esq=zeros(size(I)); 
[M,N]=size(I); 
for i=1:M
    for j=1:N
        esq= [I_sobv2m(i,j) I_sobvhm(i,j); 
        I_sobvhm(i,j) I_sobh2m(i,j)];
        I_esq(i,j)=min(eig(esq)); 
    end
end

%% Paso 36
% Muestra la imagen para detectar esquinas
figure; imshow(I_esq,[]); impixelinfo