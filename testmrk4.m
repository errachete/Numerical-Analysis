%% Test para el m�todo de Runge-Kutta de orden 4
%
% Carga los datos del problema seleccionado, aplica el m�todo de
% Runge-Kutta de orden 4 por medio de la funci�n 'mrk4' y muestra las
% gr�ficas de los resultados

datos
[t,x] = mrk4(f, intervalo, x0, N);
graficas