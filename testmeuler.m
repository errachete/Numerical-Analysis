%% Test para el método de Euler
%
% Carga los datos del problema seleccionado, aplica el método de Euler
% (explícito) por medio de la función 'meuler' y muestra las gráficas de
% los resultados

datos
[t,x] = meuler(f, intervalo, x0, 10000);
graficas