%% Test para el m�todo de Runge-Kutta de orden 3
%
% Carga los datos del problema seleccionado, aplica el m�todo de
% Runge-Kutta de orden 3 por medio de la funci�n 'mrk3' y muestra las
% gr�ficas de los resultados

datos
[t,x] = mrk3(f, intervalo, x0, N);
graficas