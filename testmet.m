%% Test para un m�todo en general

function [t,x] = testmet(met, prob)
% La funci�n testmet resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,Y]
%  x(t0)=x0
% con x0 en R^n, mediante el m�todo que se le pasa por par�metro.
%
% ENTRADA:
%  met: m�todo con el que se pretende resolver el problema
%  prob: n�mero del problema que se quiere resolver (consultar "datos.m")
%
% SALIDA:
%  t: vector columna de abscisas donde se va a aproximar la soluciu�n de
%   tipo (N+1,1)
%  x: matriz de ordenadas de la soluci�n aproximada de tipo (N+1,n)

datos
[t,x] = met(f, intervalo, x0, N);
graficas

end

