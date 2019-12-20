% Examen 2
%% Ejercicio 1
I_salt = im2double(imread('eight_salt.tif'));
I_pepper = im2double(imread('eight_pepper.tif'));
figure
subplot(2,3,1), imshow(I), title('Imagen original');
subplot(2,3,2), imshow(I_salt), title('Ruido de sal');
subplot(2,3,3), imshow(I_pepper), title('Ruido de Pimienta');

% Filtra el ruido de sal usando r=-1 en el filtro contra-armonico
I_fix1 = nlfilter(I_salt,[3 3],@c_harmonic,-1);
subplot(2,3,5), imshow(I_fix1), title('Sal eliminada, r=-1');

% Filtra el ruido de pimienta en la imagen usando r=1 en el filtro
% contra-armónico
I_fix2 = nlfilter(I_salt,[3 3],@c_harmonic,1);
subplot(2,3,6), imshow(I_fix2), title('Pimienta eliminada, r=1');

%% Ejercicio 2
% Genera una imagen de reales de un cuadrado blanco sobre fondo negro y
% muestra la imagen
I=zeros(256);
I(80:170,80:170)=1; 
subplot(2,2,1), imshow(I), title('Imagen original')

% Calcula sus fronteras y las imágenes de derivadas horizontales y
% verticales. Dibújalas.
[I_sob4,t,I_sobv,I_sobh] = edge(I,'sobel'); 
subplot(2,2,2), imshow(I_sob4), title('Sobel, Umbral automático')
subplot(2,2,3), imshow(abs(I_sobv),[]), title('Sobel, derivadas verticales') 
subplot(2,2,4), imshow(abs(I_sobh),[]), title('Sobel, derivadas horizontales')

% Empezemos a calcular la matriz de Harris para detectar esquinas en cada
% pixel.
I_sobv2=I_sobv.*I_sobv;
I_sobh2=I_sobh.*I_sobh;
I_sobvh=I_sobv.*I_sobh;

% Filtra cada una de estas tres imágenes con un filtro de unos de tamaño
% 3x3.
I_sobv2m=imfilter(I_sobv2,ones(3));
I_sobh2m= imfilter(I_sobh2,ones(3));
I_sobvhm= imfilter(I_sobvh,ones(3));

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

% Muestra la imagen para detectar esquinas
figure; imshow(I_esq,[]); impixelinfo