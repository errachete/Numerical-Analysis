%% Método de Adams-Bashforth de 4 pasos

function [t,x] = mmilne(f, intervalo, x0, N)
% La función mmilne resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,Y]
%  x(t0)=x0
% con x0 en R^n, mediante el método de Milne de 4 pasos y orden 4
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
F = [f(t(2),x(:,2)), f(t(3),x(:,3)), f(t(4),x(:,4))];


for i = 1:N-3
    x(:,i+4) = x(:,i) + 4*h/3 * (2*F(:,3) - F(:,2) + 2*F(:,));
    F(:,1:2) = F(:,2:3);
    F(:,3) = f(t(i+4),x(:,i+4));
end
t = t';
x = x';


