%% Datos
% Inicializa los datos de un problema de valor inicial con una cierta
% funci�n 'f', el intervalo en el que se quiere calcular la soluci�n, los
% valores iniciales 'x0' y el n�mero de puntos a utilizar 'N' en funci�n
% del valor almacenado en la variable 'prob'

switch(prob)
    case 1
        f = @(t,x) [x(2);-9*x(1)+8*sin(t)]; 
        intervalo = [0,2*pi]; 
        x0 = [0,4]; 
        N = 1000;
    case 2 % Oscilador arm�nico
        k = 1; m = 1;
        T = 10;
        f = @(t,x) [x(2);-(k/m)*x(1)]; 
        intervalo = [0,T];
        x0 = [1,0];
        N = 1000;
    case 3 % Ecuaciones de Van der Pol
        a = 1; b = 1;
        T = 10;
        f = @(t,x) [x(2);-(a*(x(1)^2-b)*x(2)+x(1))]
        intervalo = [0,T]
        x0 = [0.1,0.2]
        N = 1000;
end