%% Test para el método de Euler modificado
%
% Carga los datos del problema seleccionado, aplica el método de Euler
% modificado por medio de la función 'meulermod' y muestra las gráficas de
% los resultados

datos
[t,x] = meulermod(f, intervalo, x0, N);
graficas