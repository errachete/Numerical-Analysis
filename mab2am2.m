%% Método de predicción(Adam-Bashforth 2p)-corrección(Adams-Moulton 2p)

function [t,x] = mab2am2(f, intervalo, x0, N)
% La función mab2am2 resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,Y]
%  x(t0)=x0
% con x0 en R^n, mediante un método de predicción-corrección usando el 
% método de Adams-Bashforth de 2 pasos como predictor y el método de 
% Adams-Moulton de 2 pasos como corrector, y con el método de Euler 
% mejorado para inicializarlo.
%
% ENTRADA:
%  f: nombre de la función (definida en formato anónimo o como fichero de
%   tipo función de Matlab) del problema que se quiere resolver, con dos
%   argumentos de entrada: el primero es un número real y el segundo es un
%   vector columna de tipo (n,1) o un vector fila del tipo (1,n)
%  intervalo: [t0,T] donde está planteado el sistema de ecuaciones
%   diferenciales
%  x0: vector inicial de tipo (1,n)
%  N: número de subintervalos
%
% SALIDA:
%  t: vector columna de abscisas donde se va a aproximar la soluciuón de
%   tipo (N+1,1)
%  x: matriz de ordenadas de la solución aproximada de tipo (N+1,n)

h = (intervalo(2) - intervalo(1)) / N;
t = intervalo(1):h:intervalo(2);
x(:,1) = x0;

t1 = [t(1), t(2)];
[~, x1] = meulermej(f, t1, x0, 1);
x(:,2) = x1(2,:);
F = [f(t(1),x(:,1)), f(t(2),x(:,2))];

for i = 1:N-1
    % Predicción
    x(:,i+2) = x(:,i+1) + h/2 * (3*F(:,2) - F(:,1));
    % Evaluación
    F(:,3) = f(t(i+2),x(:,i+2));
    % Corrección
    x(:,i+2) = x(:,i+1) + h/12 * (5*F(:,3) + 8*F(:,2) - F(:,1));
    % Evaluación (en la última vuelta no sería necesaria)
    F(:,1) = F(:,2);
    F(:,2) = f(t(i+2),x(:,i+2));
end
t = t';
x = x';
