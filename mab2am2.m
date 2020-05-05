%% M�todo de predicci�n(Adam-Bashforth 2p)-correcci�n(Adams-Moulton 2p)

function [t,x] = mab2am2(f, intervalo, x0, N)
% La funci�n mab2am2 resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,Y]
%  x(t0)=x0
% con x0 en R^n, mediante un m�todo de predicci�n-correcci�n usando el 
% m�todo de Adams-Bashforth de 2 pasos como predictor y el m�todo de 
% Adams-Moulton de 2 pasos como corrector, y con el m�todo de Euler 
% mejorado para inicializarlo.
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
[~, x1] = meulermej(f, t1, x0, 1);
x(:,2) = x1(2,:);
F = [f(t(1),x(:,1)), f(t(2),x(:,2))];

for i = 1:N-1
    % Predicci�n
    x(:,i+2) = x(:,i+1) + h/2 * (3*F(:,2) - F(:,1));
    % Evaluaci�n
    F(:,3) = f(t(i+2),x(:,i+2));
    % Correcci�n
    x(:,i+2) = x(:,i+1) + h/12 * (5*F(:,3) + 8*F(:,2) - F(:,1));
    % Evaluaci�n (en la �ltima vuelta no ser�a necesaria)
    F(:,1) = F(:,2);
    F(:,2) = f(t(i+2),x(:,i+2));
end
t = t';
x = x';
