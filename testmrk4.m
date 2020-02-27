%% Test para el método de Runge-Kutta de orden 4
%
% Carga los datos del problema seleccionado, aplica el método de
% Runge-Kutta de orden 4 por medio de la función 'mrk4' y muestra las
% gráficas de los resultados

datos
[t,x] = mrk4(f, intervalo, x0, N);
graficas