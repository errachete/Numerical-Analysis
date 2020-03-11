%% Datos
% Inicializa los datos de un problema de valor inicial con una cierta
% función 'f', el intervalo en el que se quiere calcular la solución, los
% valores iniciales 'x0' y el número de puntos a utilizar 'N' en función
% del valor almacenado en la variable 'prob'

switch(prob)
    case 1
        f = @(t,x) [x(2);-9*x(1)+8*sin(t)]; 
        intervalo = [0,2*pi]; 
        x0 = [0,4]; 
        N = 1000;
    case 2 % Oscilador armónico
        k = 1; m = 1;
        T = 10;
        f = @(t,x) [x(2);-(k/m)*x(1)]; 
        intervalo = [0,T];
        x0 = [1,0];
        N = 1000;
    case 3 % Ecuaciones de Van der Pol
        a = 1; b = 1;
        T = 10;
        f = @(t,x) [x(2);-(a*(x(1)^2-b)*x(2)+x(1))];
        intervalo = [0,T];
        x0 = [0.1,0.2];
        N = 1000;
    case 4
        T = 10;
        f = @(t,x) [-0.1*x(1)+2*x(2);-2*x(1)-0.1*x(2)];
        intervalo = [0,T];
        x0 = [0,1];
        N = 1000;
        sol_ex = @(t) [exp(-0.1*t).*sin(2*t) exp(-0.1*t).*cos(2*t)];
    case 5
        T = 10;
        f = @(t,x) [x(2);cos(3*t)-2*x(1)];
        intervalo = [0,T];
        x0 = [1,0];
        N = 1000;
        sol_ex = @(t) [8/7*cos(sqrt(2)*t)-1/7*cos(3*t) -8/7*sin(sqrt(2)*t)*sqrt(2)+3/7*sin(3*t)];
end