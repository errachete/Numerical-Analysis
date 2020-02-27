%% Test para el método de Runge-Kutta de orden 3
%
% Carga los datos del problema seleccionado, aplica el método de
% Runge-Kutta de orden 3 por medio de la función 'mrk3' y muestra las
% gráficas de los resultados

datos
[t,x] = mrk3(f, intervalo, x0, N);
graficas