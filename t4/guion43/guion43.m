% GUI�N 4.3 RESUMEN DE MATLAB E IPT
%% crear una imagen con 2 bandas
imagen=zeros(100,200);
imagen(1:50,:)=0.75;
imshow(imagen)

%% podemos guardar el tama�o de las filas y columnas en 2 variables
f = imread('trees.tif');
[M,N] = size(f)
M=size(f,1)

whos f

%% visualizaci�n de imagenes
imshow(imagen,[0 0.74])

figure
subplot(2,1,1), imshow(imagen);
subplot(2,1,2), imshow(f);

imtool(f)

%% se puede indicar la calidad al escribir una imagen
imwrite('salida.jpg','quality',10);

%% para obtener informaci�n sobre un fichero de imagen
K = imfinfo('trees.tif');

%% calcular la raz�n de compresi�n de una imagen
im = imread('cameraman.tif');
imwrite(im,'cameraman25.jpg','quality',25);
bytes_imagencomp=K.FileSize;
bytes_imagen=K.Width*K.Height*K.BitDepth/8;
comp_ratio=bytes_imagen/bytes_imagencomp;

%% conversi�n de double a uint
f=[-0.5 0.5; 0.75 1.5];
g=im2uint8(f)

%% conversion de uint a double
A=uint8([2 100; 240 150]);
im2double(A)

%% convertir matriz a escala de grises
g = mat2gray(A);

%% conversi�n a variable l�gica
A=uint8([2 170; 140 200]);
B=im2bw(A,0.5);

%% definici�n de un vector
v=[1 3 5 7 9]

%% acceder a una posici�n del vector
v(3)
v([1 3 5]) % accede a las posiciones 1 3 y 5

x=linspace(1,15,10)

%% Matrices
A=[1 2 3; 4 5 6; 7 8 9]
A(2,3)

T2=A([1 2], [1 2 3])
A([1 3], [3 2])
R2=A(2,:)
A(2:end,end:-2:1)

%% idenxado
col_sums = sum(A)
total_sum = sum(col_sums)
total_sum2 = sum(A(:))

%% indexado l�gico
