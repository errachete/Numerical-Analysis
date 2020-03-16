%% M�todo del Punto Medio

function [t,x] = mpuntomedio(f, intervalo, x0, N)
% La funci� mpuntomedio resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,Y]
%  x(t0)=x0
% con x0 en R^n, mediante el m�todo del punto medio utilizando el m�todo
% de Euler (expl�cito) para inicializarlo.
%
% ENTRADA:
%  f: nombre de la funci�n (definida en formato an�nimo o como fichero de
%   tipo funci�n de Matlab) del problema que se quiere resolver, con dos
%   argumentos de entrada: el primero es un n�mero real y el segundo es un
%   vector columna de tipo (n,1) o un vector fila del tipo (1,n)
%  intervalo: [t0,T] donde est� planteado el sistema de ecuaciones
%   diferenciales
%  x0: vector inicial de tipo (1,n)
%  N: n�mero de subintervalos
%
% SALIDA:
%  t: vector columna de abscisas donde se va a aproximar la soluciu�n de
%   tipo (N+1,1)
%  x: matriz de ordenadas de la soluci�n aproximada de tipo (N+1,n)

h = (intervalo(2) - intervalo(1)) / N;
t = intervalo(1):h:intervalo(2);
x(:,1) = x0;

t1 = [t(1), t(2)];
[~, x1] = meuler(f, t1, x0, 1);
x(:,2) = x1(2,:);

for i = 1:N-1
    x(:,i+2) = x(:,i) + 2 * h * f(t(i+1),x(:,i+1));
end
t = t';
x = x';

