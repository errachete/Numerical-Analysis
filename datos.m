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
    case 6 % Ecuación del péndulo
        m = 1; L = 1; b = 0.25; g = 9.8; F = 0;
        T = 10;
        f = @(t,x) [x(2);F-2/m*b*x(2)-g/L*sin(x(1))];
        intervalo = [0 T];
        x0 = [pi/2,0];
        N = 1000;
    case 7 % Depredador presa con Lotka-Volterra
        a = 1; b = 1; c = 1; d = 1;
        T = 100;
        f = @(t,x) [a*x(1)-b*x(1)*x(2);-c*x(2)+d*x(1)*x(2)];
        intervalo = [0 T];
        x0 = [10,2];
        N = 1000;
    case 8 % Depredador presa más complejo
        a = 1; b = 1; c = 1; d = 1; e = 0.4; f = 0.02;
        T = 100;
        f = @(t,x) [a*x(1)-b*x(1)*x(2)-e*x(1)^2;-c*x(2)+d*x(1)*x(2)-f*x(2)*x(2)];
        intervalo = [0 T];
        x0 = [10,2];
        N = 1000;
    case 9 % Ecuación de Duffing
        a = 0;
        T = 100;
        f = @(t,x) [x(2);-a*x(2)-x(1)^3+x(1)];
        intervalo = [0 T];
        x0 = [0.5,0.5];
        N = 1000;
    case 10 % Sistema de Lorenz
        s = 10; b = 8/3; r = 99.65;
        T = 100;
        f = @(t,x) [s*(x(2)-x(1));r*x(1)-x(2)-x(1)*x(3);x(1)*x(2)-b*x(3)];
        intervalo = [0 T];
        x0 = [0,5,75];
        N = 10000;
    case 11 % Oscilador armónico forzado
        a = 10; b = 0; A = 1; w = 10.5;
        T = 10;
        f = @(t,x) [x(2);A*cos(w*t)-2*b*x(2)-a^2*x(1)];
        intervalo = [0 T];
        x0 = [0,0];
        N = 1000;
end