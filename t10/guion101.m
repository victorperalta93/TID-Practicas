% GUI�N 10.1: CONVOLUCI�N Y CORRELACI�N
%% Paso 1
% Especificar las matrices a utilizar
a = [0 0 0 1 0 0 0];
f = [1 2 3 4 5];

%% Paso 2
% Realizar la convoluci�n usando a como entrada y f como filtro
g = imfilter(a,f,'full','conv');

%% Paso 3
% Realiza la correlaci�n de las mismas matrices
h = imfilter(a,f,'full','corr');

%% Paso 4
clear all

%% Paso 5
% Utiliza imfilter para realizar una correlaci�n entre dos matrices
x = [140 108 94;89 99 125;121 134 221]
y = [-1 0 1; -2 0 2; -1 0 1]
z = imfilter(x,y,'corr');

%% Paso 6
% Utiliza imfilter para realizar la convoluci�n entre dos matrices
z2 = imfilter(x,y,'conv');