% GUIÓN 03.2 ESTRUCTURAS DE DATOS EN MATLAB

% La variable ans se utiliza para guardar el resultado de las operaciones
% que no incluyen variables.
2*3 + 4*5 + 6*7

% Si utilizamos ; la salida de la orden no se muestra
2+3;

% Uso de variable como cualquier lenguaje sin tipos
fruit_per_box = 20; num_of_boxes = 5;
total_num_of_fruit = fruit_per_box * num_of_boxes

% Se puede sobreescribir el valor de pi
pi = 3.14

% y se puede recuperar su valor original
clear pi

% Mostrar las variables del espacio de trabajo
who

% Mostrar las variables del espacio de trabajo con más detalle
whos

% Limpiar valor guardado
clear ans

% Limpiar la ventana de comandos
clc

% Limpiar el espacio de trabajo
clear all

% Matriz 3x3 
A = [1 2 3;4 5 6;7 8 9]

% crear vector de 5 valores del 1 al 5
1:5

% se puede pasar un numero intermedio para definir la operacion entre
% numeros
5:-1:1

% ¿Cómo generamos un vector de valores de 0 a pi con distancia pi/4?
0:pi/4:pi

% devuelve la columna 1 entera
A(:,1)

% devuelve la fila 1 entera
A(1,:)
colon(1,3)

% devuelve un vector entre pi/4 hasta pi con 4 posiciones 
linspace(pi/4,pi,4)


% generar matrices basicas
zeros(3,4)
ones(3,4)*10
rand(3,4)
randn(3,4)

% combinar 3 vectores para formar una matriz
X = [1 2 3]; Y = [4 5 6]; Z = [7 8 9];
A = [X;Y;Z] % importante: punto y coma para separar filas

% concatenar vectores, dimension = 1
B = cat(1,X,Y,Z)

% Borra la última fila de la matriz A
A(3,:) = []

% comprobar tamaño de una matriz
size(A)

% multiplicacion de matrices
X = [1 2 -2; 0 -3 4; 7 3 0]
Y = [1 0 -1; 2 3 -5; 1 3 5]
X*Y

% multiplicacion elemento a elemento
X .* Y

% matriz identidad
X = eye(3,4)

A = ones(4,3,2);
B = rand(5,2,3);

% devuelve el tamaño de la matriz
size(A)

% muestra los valores de la matriz por dimension
disp(B)

Y = rand(3,3)*4

% guarda la diagonal de Y en una nueva variable
Y_diag = diag(Y)

% guarda la suma de los elementos de la diagonal
Y_trace = trace(Y)

% Traspuesta de Y
Y_t = Y'

% Inversa de Y
Y_inv = inv(Y)

% determinante de Y
Y_det = det(Y)

% las llaves se utilizan para crear una variable de tipo cell
% puede guardar datos de varios tipos y tamaños
clear X
X{1} = [1 2 3;4 5 6;7 8 9]
X{2} = 2+3i
X{3} = 'String'

celldisp(X)

% ejemplos de cómo darle valores a celdas de matrices
%X(3) = 'This produces an error'
X(3) = {'This is okay'}
X{3} = 'This is okay too'

% Imagenes
my_images(1).imagename = 'Image 1';
my_images(1).width = 256;
my_images(1).height = 256;
my_images(2).imagename = 'Image 2';
my_images(2).width = 128;
my_images(2).height = 128;

% acceder a info
my_images(1)
my_images(1).imagename

num_of_images = prod(size(my_images))
fieldnames(my_images)
class(my_images)
isstruct(my_images)
isstruct(num_of_images)