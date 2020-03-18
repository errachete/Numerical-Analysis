%% Test para un método en general

function [t,x] = testmet(met, prob)
% La función testmet resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,Y]
%  x(t0)=x0
% con x0 en R^n, mediante el método que se le pasa por parámetro.
%
% ENTRADA:
%  met: método con el que se pretende resolver el problema
%  prob: número del problema que se quiere resolver (consultar "datos.m")
%
% SALIDA:
%  t: vector columna de abscisas donde se va a aproximar la soluciuón de
%   tipo (N+1,1)
%  x: matriz de ordenadas de la solución aproximada de tipo (N+1,n)

datos
[t,x] = met(f, intervalo, x0, N);
graficas

end

