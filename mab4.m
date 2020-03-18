%% Método de Adams-Bashforth de 4 pasos

function [t,x] = mab4(f, intervalo, x0, N)
% La función mab4 resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,Y]
%  x(t0)=x0
% con x0 en R^n, mediante el método de Adams-Bashforth de 4 pasos
% utilizando el método de Runge-Kutta de orden 3 para inicializarlo.
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

t1 = [t(1), t(4)];
[~, x1] = mrk3(f, t1, x0, 3);
x(:,2) = x1(2,:);
x(:,3) = x1(3,:);
x(:,4) = x1(4,:);

for i = 1:N-3
    x(:,i+4) = x(:,i+3) + h/24 * (55*f(t(i+3),x(:,i+3)) - 59*f(t(i+2),x(:,i+2)) + 37*f(t(i+1),x(:,i+1)) - 9*f(t(i),x(:,i)));
end
t = t';
x = x';
